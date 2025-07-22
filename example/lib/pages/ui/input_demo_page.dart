import 'package:flutter/material.dart';
import 'package:castor_flutter/ui/input.dart';

class InputDemoPage extends StatefulWidget {
  const InputDemoPage({super.key});

  @override
  State<InputDemoPage> createState() => _InputDemoPageState();
}

class _InputDemoPageState extends State<InputDemoPage> {
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
              CastorInput(
                label: '请输入内容',
                onChanged: (val) {
                  setState(() {
                    _value = val;
                  });
                },
              ),
              const SizedBox(height: 16),
              Text('当前输入：$_value', style: const TextStyle(fontSize: 18)),
            ],
          ),
        )));
  }
}
