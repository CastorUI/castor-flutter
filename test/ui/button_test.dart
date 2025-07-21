import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:castor_flutter/ui/button.dart';

void main() {
  testWidgets('CastorButton renders with label and responds to tap', (WidgetTester tester) async {
    bool tapped = false;
    await tester.pumpWidget(
      MaterialApp(
        home: CastorButton(
          label: 'Test Button',
          onPressed: () {
            tapped = true;
          },
        ),
      ),
    );
    expect(find.text('Test Button'), findsOneWidget);
    await tester.tap(find.byType(CastorButton));
    await tester.pump();
    expect(tapped, isTrue);
  });
} 