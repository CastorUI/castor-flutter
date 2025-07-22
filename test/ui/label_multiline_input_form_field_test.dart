import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:castor_flutter/ui/form/label_multiline_input_form_field.dart';

void main() {
  testWidgets('LabelMultilineInputFormField renders label and responds to input', (WidgetTester tester) async {
    String? savedValue;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LabelMultilineInputFormField(
            label: 'Description',
            initialValue: 'init',
            saveHandler: (val) {
              savedValue = val;
            },
          ),
        ),
      ),
    );
    expect(find.text('Description'), findsOneWidget);
    expect(find.text('init'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'new multiline value');
    expect(savedValue, 'new multiline value');
  });
} 