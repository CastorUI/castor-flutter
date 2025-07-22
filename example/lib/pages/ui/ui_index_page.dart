import 'package:flutter/material.dart';
import 'button_demo_page.dart';
import 'input_demo_page.dart';
import 'label_input_form_field_demo_page.dart';

class UIIndexPage extends StatelessWidget {
  const UIIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.smart_button),
          title: const Text('按钮 Button'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const ButtonDemoPage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.input),
          title: const Text('输入框 Input'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const InputDemoPage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.label),
          title: const Text('Label Input Form Field'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const LabelInputFormFieldDemoPage()),
            );
          },
        ),
        // 可继续添加更多组件入口
      ],
    );
  }
} 