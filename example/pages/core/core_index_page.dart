import 'package:flutter/material.dart';
import 'calculator_demo_page.dart';

class CoreIndexPage extends StatelessWidget {
  const CoreIndexPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.calculate),
          title: const Text('Calculator 示例'),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => const CalculatorDemoPage()),
            );
          },
        ),
        // 可继续添加更多 core 相关功能入口
      ],
    );
  }
}
