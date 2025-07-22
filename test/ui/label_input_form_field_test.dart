import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:castor_flutter/ui/form/label_input_form_field.dart';

void main() {
  testWidgets('LabelInputFormField renders label and responds to input', (WidgetTester tester) async {
    String? savedValue;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LabelInputFormField(
            label: 'Test Label',
            initialValue: 'init',
            saveHandler: (val) {
              savedValue = val;
            },
          ),
        ),
      ),
    );
    expect(find.text('Test Label'), findsOneWidget);
    expect(find.text('init'), findsOneWidget);
    await tester.enterText(find.byType(TextFormField), 'newvalue');
    // onChanged and onSaved both call saveHandler
    expect(savedValue, 'newvalue');
  });
} 