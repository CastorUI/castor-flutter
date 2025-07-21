import 'package:flutter/material.dart';
import 'package:castor_flutter/ui/button.dart';

class ButtonDemoPage extends StatelessWidget {
  const ButtonDemoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('按钮 Button 示例')),
      body: Center(
        child: CastorButton(
          label: 'Click Me',
          onPressed: () {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('CastorButton clicked!')),
            );
          },
        ),
      ),
    );
  }
} 