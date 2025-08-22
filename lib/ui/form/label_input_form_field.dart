import 'package:castor_flutter/ui/utils/style.dart';
import 'package:castor_flutter/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class LabelInputFormField extends StatelessWidget {
  /// Field label
  final String? label;

  /// Initial value
  final String? initialValue;

  /// Validator
  final Function? validator;

  /// Save handler
  final Function? saveHandler;

  /// Whether enabled, default true
  final bool enabled;

  /// Whether autofocus, default false
  final bool autoFocus;

  /// Whether allow empty, default true
  final bool allowEmpty;

  const LabelInputFormField(
      {super.key,
      this.label,
      this.initialValue,
      this.validator,
      this.saveHandler,
      this.enabled = true,
      this.autoFocus = false,
      this.allowEmpty = true});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration:
            const BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1)),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              allowEmpty
                  ? Container()
                  : const Padding(
                      padding: EdgeInsets.only(top: 5, right: 2),
                      child: Text('*', style: AppTextStyle.formLabelRequired),
                    ),
              Text(
                label ?? '',
                style: AppTextStyle.formLabel,
                textAlign: TextAlign.left,
              ),
              Expanded(
                  child: TextFormField(
                textAlign: TextAlign.right,
                maxLines: 1,
                decoration: InputDecoration(
          hintText: enabled
            ? AppLocalizations.of(context).pleaseEnter
            : AppLocalizations.of(context).none,
                  hintStyle: AppTextStyle.formLightGrayText,
                  disabledBorder: InputBorder.none,
                  enabledBorder: const UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Colors.black38, width: 1.5)),
                  focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                          color: Theme.of(context).colorScheme.primary,
                          width: 1.5)),
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(
                      "[\\a-\\z\\A-\\Z0-9\\u4E00-\\u9FA5\\.\\,\\?\\<\\>\\。\\，\\-\\——\\=\\;\\！\\!\\+]")), // Allow Chinese characters, letters, numbers and common punctuations
                  LengthLimitingTextInputFormatter(50), // Max length
                ],
                initialValue: initialValue ?? '',
                // controller: controller,
                style: AppTextStyle.formText,
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
                autofocus: autoFocus,
              ))
            ]));
  }
}
