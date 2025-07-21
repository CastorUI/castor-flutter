import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:castor_flutter/ui/input.dart';

void main() {
  testWidgets('CastorInput renders with label and responds to input', (WidgetTester tester) async {
    String value = '';
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CastorInput(
            label: '测试输入',
            onChanged: (val) {
              value = val;
            },
          ),
        ),
      ),
    );
    expect(find.text('测试输入'), findsOneWidget);
    await tester.enterText(find.byType(TextField), 'hello');
    expect(value, 'hello');
  });
} 