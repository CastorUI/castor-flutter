import 'dart:convert';

import 'package:castor_flutter/ui/utils/constants.dart';
import 'package:castor_flutter/ui/utils/file.dart';
import 'package:castor_flutter/ui/widgets/toast.dart';
import 'package:castor_flutter/l10n/l10n.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class SingleImage extends StatefulWidget {
  final String? defaultImageUrl;
  final bool enabled;
  final Function? saveHandler;
  final Future<String?> Function(MultipartFile file)? uploadHandler;
  final double avatarWidth;
  final double avatarHeight;
  final Color preivewBgColor;
  const SingleImage(this.defaultImageUrl, this.enabled,
      {super.key,
      this.saveHandler,
      this.uploadHandler,
      this.avatarWidth = 80,
      this.avatarHeight = 80,
      this.preivewBgColor = Colors.black});

  @override
  State<SingleImage> createState() => _SingleImageState();
}

class _SingleImageState extends State<SingleImage> {
  String? _imageUrl;
  final imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _imageUrl = widget.defaultImageUrl;
  }

  /// Handle the picked image: validate format, convert to MultipartFile,
  /// call uploadHandler, update image or show format error.
  /// [pickedFile] The selected image file.
  /// [usePath] Whether to validate using path (camera) or name (gallery).
  Future<void> _handlePickedFile(XFile? pickedFile,
      {required bool usePath}) async {
    if (pickedFile != null) {
      String formatTarget = usePath ? pickedFile.path : pickedFile.name;
      CompressFormat? format = FileUtil.getCompressFormat(formatTarget);
      if (format != null) {
        if (widget.uploadHandler != null) {
          MultipartFile file = await FileUtil.xFileToMultipartFile(pickedFile);
          String? imageUrl = await widget.uploadHandler!(file);
          if (imageUrl != null && mounted) {
            setState(() {
              _imageUrl = imageUrl;
            });
            if (widget.saveHandler != null) {
              widget.saveHandler!(_imageUrl);
            }
          }
        }
      } else {
        if (mounted) {
          toastWarning(context, AppLocalizations.of(context).invalidImageFormat);
        }
      }
    }
  }

  /// Take photo by camera and handle image.
  Future _getCamera() async {
    Navigator.of(context).pop();
    final XFile? pickedFile =
        await imagePicker.pickImage(source: ImageSource.camera);
    await _handlePickedFile(pickedFile, usePath: true);
  }

  /// Pick image from gallery and handle image.
  Future _getImage() async {
    Navigator.of(context).pop();
    final XFile? pickedFile =
        await imagePicker.pickImage(source: ImageSource.gallery);
    await _handlePickedFile(pickedFile, usePath: false);
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
                    onTap: _getImage,
                    child: ListTile(
                      leading: Icon(Icons.photo),
                      title: Text(AppLocalizations.of(context).gallery),
                    )),
              ],
            ),
          );
        });
  }

  Widget _getImageWidget() {
    return Container(
      margin: const EdgeInsets.fromLTRB(0, 8, 12, 0),
      decoration: BoxDecoration(
          border: Border.all(
              width: 1.0, color: const Color.fromRGBO(204, 204, 204, 1)),
          borderRadius: const BorderRadius.all(Radius.circular(4))),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: GestureDetector(
              onTap: _getActionSheet,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(4),
                  child: (_imageUrl ?? '').isEmpty
                      ? Image.memory(base64.decode(defaultImageBase64),
                          fit: BoxFit.fill,
                          width: widget.avatarWidth,
                          height: widget.avatarHeight)
                      : Image.network(_imageUrl!,
                          fit: BoxFit.fill,
                          width: widget.avatarWidth,
                          height: widget.avatarHeight)))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.centerLeft,
        child: Wrap(
            runSpacing: 8,
            spacing: 8,
            alignment: WrapAlignment.start,
            children: [
              _getImageWidget(),
            ]));
  }
}
