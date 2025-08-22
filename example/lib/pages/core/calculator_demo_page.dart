import 'package:flutter/material.dart';
import 'package:castor_flutter/core/calculator.dart';

class CalculatorDemoPage extends StatefulWidget {
  const CalculatorDemoPage({super.key});

  @override
  State<CalculatorDemoPage> createState() => _CalculatorDemoPageState();
}

class _CalculatorDemoPageState extends State<CalculatorDemoPage> {
  final Calculator _calculator = Calculator();
  int _input = 0;
  int? _result;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Calculator Demo')),
        body: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: const InputDecoration(
                  labelText: '输入一个整数',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    _input = int.tryParse(value) ?? 0;
                  });
                },
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _result = _calculator.addOne(_input);
                  });
                },
                child: const Text('加一'),
              ),
              const SizedBox(height: 16),
              if (_result != null)
                Text('结果：$_result', style: const TextStyle(fontSize: 20)),
            ],
          ),
        ));
  }
}
