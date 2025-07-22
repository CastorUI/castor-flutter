import 'package:flutter/material.dart';
import 'package:castor_flutter/ui/form/label_input_form_field.dart';

class LabelInputFormFieldDemoPage extends StatefulWidget {
  const LabelInputFormFieldDemoPage({super.key});

  @override
  State<LabelInputFormFieldDemoPage> createState() =>
      _LabelInputFormFieldDemoPageState();
}

class _LabelInputFormFieldDemoPageState
    extends State<LabelInputFormFieldDemoPage> {
  String _value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('按钮 Button 示例')),
        body: Center(
            child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LabelInputFormField(
                label: 'Username',
                initialValue: _value,
                saveHandler: (val) {
                  setState(() {
                    _value = val ?? '';
                  });
                },
              ),
              const SizedBox(height: 16),
              Text('Current value: $_value',
                  style: const TextStyle(fontSize: 18)),
            ],
          ),
        )));
  }
}
