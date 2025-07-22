import 'package:flutter/material.dart';
import 'label_input_form_field_demo_page.dart';
import 'label_select_form_field_demo_page.dart';
import 'label_switch_form_field_demo_page.dart';
import 'label_multiline_input_form_field_demo_page.dart';
import 'label_single_image_form_field_demo_page.dart';
import 'label_multi_images_form_field_demo_page.dart';

class UIIndexPage extends StatelessWidget {
  const UIIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.label),
          title: const Text('Label Input Form Field'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const LabelInputFormFieldDemoPage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.list),
          title: const Text('Label Select Form Field'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const LabelSelectFormFieldDemoPage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.toggle_on),
          title: const Text('Label Switch Form Field'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const LabelSwitchFormFieldDemoPage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.notes),
          title: const Text('Label Multiline Input Form Field'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const LabelMultilineInputFormFieldDemoPage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.image),
          title: const Text('Label Single Image Form Field'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const LabelSingleImageFormFieldDemoPage()),
            );
          },
        ),
        ListTile(
          leading: const Icon(Icons.collections),
          title: const Text('Label Multi Images Form Field'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const LabelMultiImagesFormFieldDemoPage()),
            );
          },
        ),
        // 可继续添加更多组件入口
      ],
    );
  }
} 