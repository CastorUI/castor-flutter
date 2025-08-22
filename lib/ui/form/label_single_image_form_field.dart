import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:castor_flutter/ui/utils/style.dart';
import 'photo/single_image.dart';
import 'package:castor_flutter/l10n/l10n.dart';

class LabelSingleImageFormField extends StatelessWidget {
  /// Field label
  final String? label;

  /// Initial value
  final String? initialValue;

  /// Upload handler
  final Future<String?> Function(MultipartFile file)? uploadHandler;

  /// Save handler
  final Function? saveHandler;

  /// Whether enabled, default true
  final bool enabled;

  /// Whether allow empty, default true
  final bool allowEmpty;

  final double avatarWidth;

  final double avatarHeight;

  const LabelSingleImageFormField({
    super.key,
    this.label,
    this.initialValue,
    this.uploadHandler,
    this.saveHandler,
    this.enabled = true,
    this.allowEmpty = true,
    this.avatarWidth = 80,
    this.avatarHeight = 80,
  });

  @override
  Widget build(BuildContext context) {
    var imageEnabled = enabled;
    var showLabel = label != null && label!.isNotEmpty;
    return Container(
        padding: const EdgeInsets.fromLTRB(0, 12, 0, 8),
        child: Column(
          children: <Widget>[
            showLabel
                ? Row(
                    children: <Widget>[
                      allowEmpty
                          ? Container()
                          : const Padding(
                              padding: EdgeInsets.only(top: 5, right: 2),
                              child: Text('*',
                                  style: AppTextStyle.formLabelRequired),
                            ),
                      Text(
                        label ?? AppLocalizations.of(context).none,
                        style: AppTextStyle.formLabel,
                      ),
                    ],
                  )
                : Container(),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: SingleImage(
                initialValue,
                imageEnabled,
                uploadHandler: uploadHandler,
                saveHandler: saveHandler,
                avatarWidth: avatarWidth,
                avatarHeight: avatarHeight,
              ),
            )
          ],
        ));
  }
}
