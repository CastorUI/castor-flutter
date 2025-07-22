import 'package:flutter/material.dart';
import 'package:castor_flutter/ui/form/label_select_form_field.dart';

class LabelSelectFormFieldDemoPage extends StatefulWidget {
  const LabelSelectFormFieldDemoPage({super.key});

  @override
  State<LabelSelectFormFieldDemoPage> createState() => _LabelSelectFormFieldDemoPageState();
}

class _LabelSelectFormFieldDemoPageState extends State<LabelSelectFormFieldDemoPage> {
  int? _selected = 1;
  final Map<int, String> _options = {1: 'Apple', 2: 'Banana', 3: 'Orange'};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Label Select Form Field Demo')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LabelSelectFormField(
                label: 'Fruit',
                initialValue: _selected,
                options: _options,
                saveHandler: (val) {
                  setState(() {
                    _selected = val as int?;
                  });
                },
              ),
              const SizedBox(height: 16),
              Text('Selected:  ${_options[_selected] ?? ''}', style: const TextStyle(fontSize: 18)),
            ],
          ),
        ),
      ),
    );
  }
} 