import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:castor_flutter/ui/utils/style.dart';
import 'package:castor_flutter/l10n/l10n.dart';

import 'photo/multi_images.dart';

class LabelMultiImagesFormField extends StatelessWidget {
  /// Field label
  final String? label;

  /// Initial value
  final List<String>? initialValue;

  /// Save handler
  final Function? saveHandler;

  /// Upload handler
  final Future<String?> Function(MultipartFile)? uploadHandler;

  /// Whether enabled, default true
  final bool? enabled;

  /// Whether allow empty, default true
  final bool allowEmpty;

  const LabelMultiImagesFormField({
    super.key,
    this.label,
    this.initialValue,
    this.saveHandler,
    this.uploadHandler,
    this.enabled = true,
    this.allowEmpty = true,
  });

  @override
  Widget build(BuildContext context) {
    var imageEnabled = enabled ?? true;
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
              child: MultiImages(
                initialValue ?? <String>[],
                imageEnabled,
                saveHandler: saveHandler,
                uploadHandler: uploadHandler,
              ),
            )
          ],
        ));
  }
}
