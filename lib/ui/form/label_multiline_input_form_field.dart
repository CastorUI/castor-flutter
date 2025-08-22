import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:castor_flutter/ui/utils/style.dart';
import 'package:castor_flutter/l10n/l10n.dart';

class LabelMultilineInputFormField extends StatelessWidget {
  /// Field label
  final String label;

  /// Initial value
  final String? initialValue;

  /// Validator
  final Function? validator;

  /// Save handler
  final Function? saveHandler;

  /// Max display lines
  final int maxLines;

  final String trailingText;

  /// Whether enabled, default true
  final bool enabled;

  /// Whether allow empty, default true
  final bool allowEmpty;

  const LabelMultilineInputFormField(
      {super.key,
      required this.label,
      required this.saveHandler,
      this.initialValue,
      this.validator,
      this.trailingText = '',
      this.maxLines = 3,
      this.enabled = true,
      this.allowEmpty = true});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
      decoration: const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
      child: Column(
        children: <Widget>[
          Align(
              alignment: Alignment.centerLeft,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    allowEmpty
                        ? Container()
                        : const Padding(
                            padding: EdgeInsets.only(top: 5, right: 2),
                            child: Text('*',
                                style: AppTextStyle.formLabelRequired),
                          ),
                    Text(label, style: AppTextStyle.formLabel)
                  ])),
          Padding(
              padding: const EdgeInsets.only(top: 8),
              child: TextFormField(
                autocorrect: false,
                style: AppTextStyle.formText,
                maxLines: maxLines,
                decoration: InputDecoration(
          hintText: enabled
            ? AppLocalizations.of(context).pleaseEnter
            : AppLocalizations.of(context).noData,
                    hintStyle: AppTextStyle.formLightGrayText,
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(230, 230, 230, 1)))),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(
                      "[\\a-\\z\\A-\\Z0-9\\u4E00-\\u9FA5\\.\\,\\?\\<\\>\\。\\，\\-\\——\\=\\;\\！\\!\\+]")), // Allow Chinese characters, letters, numbers and common punctuations
                  LengthLimitingTextInputFormatter(50), // Max length
                ],
                initialValue: initialValue,
                validator: validator as FormFieldValidator<String>?,
                autovalidateMode: AutovalidateMode.always,
                onSaved: (value) {
                  if (saveHandler != null) {
                    saveHandler!(value);
                  }
                },
                onChanged: (value) {
                  if (saveHandler != null) {
                    saveHandler!(value);
                  }
                },
                enabled: enabled,
              )),
          trailingText.isEmpty
              ? Container()
              : Padding(
                  padding: const EdgeInsets.only(top: 8),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child:
                          Text(trailingText, style: AppTextStyle.formLabel))),
        ],
      ),
    );
  }
}
