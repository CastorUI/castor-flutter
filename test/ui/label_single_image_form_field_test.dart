import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:castor_flutter/ui/form/label_single_image_form_field.dart';

void main() {
  testWidgets('LabelSingleImageFormField renders label and initial image',
      (WidgetTester tester) async {
    String? savedValue;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LabelSingleImageFormField(
            label: 'Avatar',
            initialValue: '',
            saveHandler: (val) {
              savedValue = val;
            },
            uploadHandler: (_) async {
              // Simulate upload and return a new image url
              await Future.delayed(const Duration(milliseconds: 500));
              return 'https://q2.itc.cn/q_70/images03/20241013/47ff05019e93455abd85cd47612fbf7b.jpeg';
            },
          ),
        ),
      ),
    );
    expect(find.text('Avatar'), findsOneWidget);
    // The image widget should be present
    expect(find.byType(Image), findsOneWidget);
    
    // 点击图片
    await tester.tap(find.byType(Image));
    await tester.pumpAndSettle();

    // 验证弹窗内容
    expect(find.text('拍照'), findsOneWidget);
    expect(find.text('相册'), findsOneWidget);

    // 模拟选择“相册”
    await tester.tap(find.text('相册'));
    await tester.pumpAndSettle();

      // 断言后续逻辑（如 saveHandler 被调用等）
    expect(savedValue, 'https://q2.itc.cn/q_70/images03/20241013/47ff05019e93455abd85cd47612fbf7b.jpeg');
  });
}
