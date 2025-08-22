import 'package:castor_flutter/ui/entities/tuple_entity.dart';
import 'package:flutter/material.dart';
import 'package:castor_flutter/ui/utils/style.dart';

class LabelSwitchFormField extends StatelessWidget {
  /// Field label
  final String? label;

  /// Initial value
  final TupleEntity<bool, String>? initialValue;

  /// Save handler
  final Function? saveHandler;

  /// Whether enabled, default true
  final bool enabled;

  const LabelSwitchFormField(
      {super.key,
      this.label,
      this.initialValue,
      this.saveHandler,
      this.enabled = true});

  @override
  Widget build(BuildContext context) {
    var switchEnabled = enabled;
    return Container(
      decoration:
          BoxDecoration(color: Color.fromRGBO(255, 255, 255, 1), boxShadow: []),
      child: Row(
        children: <Widget>[
          Text(
            label ?? '',
            style: AppTextStyle.formLabel,
          ),
          Expanded(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: SizedBox(
                      child: SwitchListTile(
                    activeColor: Color.fromRGBO(58, 102, 242, 1),
                    contentPadding: EdgeInsets.only(right: 0),
                    value: initialValue?.key ?? false,
                    onChanged: switchEnabled
                        ? saveHandler as ValueChanged<bool>?
                        : null,
                  ))))
        ],
      ),
    );
  }
}
