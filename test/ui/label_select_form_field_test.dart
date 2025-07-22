import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:castor_flutter/ui/form/label_select_form_field.dart';

void main() {
  testWidgets('LabelSelectFormField renders label and responds to selection', (WidgetTester tester) async {
    dynamic savedValue;
    final options = {1: 'Option 1', 2: 'Option 2'};
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LabelSelectFormField(
            label: 'Test Select',
            initialValue: 1,
            options: options,
            saveHandler: (val) {
              savedValue = val;
            },
          ),
        ),
      ),
    );
    expect(find.text('Test Select'), findsOneWidget);
    expect(find.text('Option 1'), findsOneWidget);
    await tester.tap(find.byType(DropdownButton));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Option 2').last);
    await tester.pumpAndSettle();
    expect(savedValue, 2);
  });
} 