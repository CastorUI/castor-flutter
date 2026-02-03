import 'package:castor_flutter/ui/form/photo/image_preview.dart';
import 'package:castor_flutter/ui/utils/file.dart';
import 'package:castor_flutter/ui/widgets/toast.dart';
import 'package:castor_flutter/l10n/l10n.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:photo_manager/photo_manager.dart';
import 'package:image_picker/image_picker.dart';

class MultiImages extends StatefulWidget {
  final List<String> imageUrls;
  final bool enabled;
  final Function? saveHandler;
  final Future<String?> Function(MultipartFile file)? uploadHandler;
  final double avatarWidth;
  final double avatarHeight;
  final Color preivewBgColor;
  const MultiImages(this.imageUrls, this.enabled,
      {super.key,
      this.saveHandler,
      this.uploadHandler,
      this.avatarWidth = 80,
      this.avatarHeight = 80,
      this.preivewBgColor = Colors.black});

  @override
  State<MultiImages> createState() => _MultiImagesState();
}

class _MultiImagesState extends State<MultiImages> {
  List<AssetEntity> picked = [];
  final imagePicker = ImagePicker();

  // Take photo from camera
  Future _getCamera() async {
    Navigator.of(context).pop();
    final XFile? pickedFile =
        await imagePicker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      CompressFormat? format = FileUtil.getCompressFormat(pickedFile.path);
      if (format != null) {
        MultipartFile file = await FileUtil.xFileToMultipartFile(pickedFile);
        String? imageUrl = await widget.uploadHandler?.call(file);
        setState(() {
          if (imageUrl != null) {
            widget.imageUrls.add(imageUrl);
          }
          if (widget.saveHandler != null) {
            widget.saveHandler!(widget.imageUrls);
          }
        });
      } else {
        if (mounted) {
          toastWarning(context, AppLocalizations.of(context).invalidImageFormat);
        }
      }
    }
  }

  // Pick multiple images from gallery
  Future _getImages() async {
    Navigator.of(context).pop();
    final List<XFile> pickedFiles = await imagePicker.pickMultiImage();
    List<String> selectedImageUrls = [];
    List<String> invalidImageUrls = [];
    if (pickedFiles.isNotEmpty) {
      for (var pickedFile in pickedFiles) {
        CompressFormat? format = FileUtil.getCompressFormat(pickedFile.name);
        if (format != null) {
          MultipartFile file = await FileUtil.xFileToMultipartFile(pickedFile);
          String? imageUrl = await widget.uploadHandler?.call(file);
          if (imageUrl != null) {
            selectedImageUrls.add(imageUrl);
          }
        } else {
          invalidImageUrls.add(pickedFile.path);
        }
      }
    }

    if (invalidImageUrls.isNotEmpty) {
      if (mounted) {
        toastWarning(context, AppLocalizations.of(context)
            .unsupportedImagesSkipped(invalidImageUrls.length));
      }
    }

    setState(() {
      widget.imageUrls.addAll(selectedImageUrls);
      if (widget.saveHandler != null) {
        widget.saveHandler!(widget.imageUrls);
      }
    });
  }

  Future _getActionSheet() async {
  // Unfocus current text field to hide keyboard
    FocusScope.of(context).requestFocus(FocusNode());
    await showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SingleChildScrollView(
            child: Column(
              children: <Widget>[
                InkWell(
                    onTap: _getCamera,
                    child: ListTile(
                      leading: Icon(Icons.photo_camera),
                      title: Text(AppLocalizations.of(context).camera),
                    )),
                InkWell(
                    onTap: _getImages,
                    child: ListTile(
                      leading: Icon(Icons.photo),
                      title: Text(AppLocalizations.of(context).gallery),
                    )),
              ],
            ),
          );
        });
  }

  Widget getPhoto() {
    return Container(
        margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: GestureDetector(
          child: Container(
            width: widget.avatarWidth,
            height: widget.avatarHeight,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 1.0, color: const Color.fromRGBO(204, 204, 204, 1)),
                borderRadius: const BorderRadius.all(Radius.circular(4))),
            child: Icon(
              Icons.camera_alt,
              size: 40,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
          onTap: () => _getActionSheet(),
        ));
  }

  List<Widget> _getImageList() {
    List<Widget> imgs = [];
    for (int i = 0; i < widget.imageUrls.length; i++) {
      var imageWidget = Container(
        margin: const EdgeInsets.fromLTRB(0, 8, 12, 0),
        decoration: BoxDecoration(
            border: Border.all(
                width: 1.0, color: const Color.fromRGBO(204, 204, 204, 1)),
            borderRadius: const BorderRadius.all(Radius.circular(4))),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: GestureDetector(
                onTap: () {
                  // 点击图片时让当前焦点所在的文本框失焦，隐藏键盘
                  FocusScope.of(context).requestFocus(FocusNode());
                  Navigator.of(context).push(
                    MaterialPageRoute(
                        builder: (_) => ImagePreviewPage({
                              'photoList': widget.imageUrls,
                              'index': i,
                              'preivewBgColor': widget.preivewBgColor
                            })),
                  );
                },
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(4),
                    child: Image.network(widget.imageUrls[i],
                        fit: BoxFit.fill,
                        width: widget.avatarWidth,
                        height: widget.avatarHeight)))),
      );
      var deleteWidget = GestureDetector(
        child: ClipOval(
          child: Container(
            width: 24.0,
            height: 24.0,
            color: Colors.red[400],
            child: const Icon(Icons.close, color: Colors.white, size: 12.0),
          ),
        ),
        onTap: () {
          // 点击图片时让当前焦点所在的文本框失焦，隐藏键盘
          FocusScope.of(context).requestFocus(FocusNode());
          setState(() {
            widget.imageUrls.remove(widget.imageUrls[i]);
            if (widget.saveHandler != null) {
              widget.saveHandler!(widget.imageUrls);
            }
          });
        },
      );
      if (widget.enabled) {
        imgs.add(Stack(
            alignment: Alignment.topRight,
            children: <Widget>[imageWidget, deleteWidget]));
      } else {
        imgs.add(imageWidget);
      }
    }

    if (widget.enabled) {
      imgs.add(getPhoto());
    }
    return imgs;
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
            runSpacing: 8,
            spacing: 8,
            alignment: WrapAlignment.start,
            children: _getImageList()));
  }
}
