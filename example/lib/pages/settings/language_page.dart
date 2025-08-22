import 'package:flutter/material.dart';

/// A simple language selection page that highlights the current selection
/// and returns the chosen value when tapped.
///
/// [currentCode]: 'system' | 'en' | 'zh'
/// [onSelected]: callback with the chosen code
class LanguageSelectionPage extends StatefulWidget {
  const LanguageSelectionPage({
    super.key,
    required this.currentCode,
    required this.onSelected,
  });

  final String currentCode; // 'system' | 'en' | 'zh'
  final ValueChanged<String> onSelected;

  @override
  State<LanguageSelectionPage> createState() => _LanguageSelectionPageState();
}

class _LanguageSelectionPageState extends State<LanguageSelectionPage> {
  late String _selected;

  @override
  void initState() {
    super.initState();
    _selected = widget.currentCode;
  }

  void _choose(String value) {
    setState(() => _selected = value);
    widget.onSelected(value);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language')),
      body: ListView(
        children: [
          RadioListTile<String>(
            title: const Text('System default'),
            value: 'system',
            groupValue: _selected,
            onChanged: (v) => _choose(v!),
          ),
          const Divider(height: 0),
          RadioListTile<String>(
            title: const Text('English'),
            value: 'en',
            groupValue: _selected,
            onChanged: (v) => _choose(v!),
          ),
          const Divider(height: 0),
          RadioListTile<String>(
            title: const Text('中文'),
            value: 'zh',
            groupValue: _selected,
            onChanged: (v) => _choose(v!),
          ),
        ],
      ),
    );
  }
}
