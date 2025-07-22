import 'package:flutter/material.dart';
import 'package:castor_flutter/ui/form/label_switch_form_field.dart';
import 'package:castor_flutter/ui/entities/tuple_entity.dart';

class LabelSwitchFormFieldDemoPage extends StatefulWidget {
  const LabelSwitchFormFieldDemoPage({super.key});

  @override
  State<LabelSwitchFormFieldDemoPage> createState() => _LabelSwitchFormFieldDemoPageState();
}

class _LabelSwitchFormFieldDemoPageState extends State<LabelSwitchFormFieldDemoPage> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Label Switch Form Field Demo')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LabelSwitchFormField(
                label: 'Enable feature',
                initialValue: TupleEntity(_switchValue, _switchValue ? 'On' : 'Off'),
                saveHandler: (val) {
                  setState(() {
                    _switchValue = val as bool;
                  });
                },
              ),
              const SizedBox(height: 16),
              Text('Switch is: ${_switchValue ? 'On' : 'Off'}', style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
} 