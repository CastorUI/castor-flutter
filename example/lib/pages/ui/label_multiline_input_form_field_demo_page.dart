import 'package:flutter/material.dart';
import 'package:castor_flutter/ui/form/label_multiline_input_form_field.dart';

class LabelMultilineInputFormFieldDemoPage extends StatefulWidget {
  const LabelMultilineInputFormFieldDemoPage({super.key});

  @override
  State<LabelMultilineInputFormFieldDemoPage> createState() => _LabelMultilineInputFormFieldDemoPageState();
}

class _LabelMultilineInputFormFieldDemoPageState extends State<LabelMultilineInputFormFieldDemoPage> {
  String _value = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multiline Input Form Field Demo')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LabelMultilineInputFormField(
                label: 'Description',
                initialValue: _value,
                saveHandler: (val) {
                  setState(() {
                    _value = val ?? '';
                  });
                },
                maxLines: 4,
              ),
              const SizedBox(height: 16),
              Text('Current value: $_value', style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
} 