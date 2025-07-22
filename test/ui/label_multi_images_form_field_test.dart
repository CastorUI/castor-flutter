import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:castor_flutter/ui/form/label_multi_images_form_field.dart';

void main() {
  testWidgets('LabelMultiImagesFormField renders label and images, and handles image selection', (WidgetTester tester) async {
    List<String>? savedValue;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: LabelMultiImagesFormField(
            label: 'Gallery',
            initialValue: ['https://via.placeholder.com/80'],
            saveHandler: (val) {
              savedValue = val as List<String>?;
            },
          ),
        ),
      ),
    );
    expect(find.text('Gallery'), findsOneWidget);
    // The MultiImages widget should be present (could be a Row or ListView)
    expect(find.byType(Image), findsWidgets);
    // 点击第一个图片，模拟弹窗出现
    await tester.tap(find.byType(Image).first);
    await tester.pumpAndSettle();
    // 验证弹窗内容（如“拍照”、“相册”）
    expect(find.text('拍照'), findsOneWidget);
    expect(find.text('相册'), findsOneWidget);
    // 模拟选择“相册”
    await tester.tap(find.text('相册'));
    await tester.pumpAndSettle();
    // 假设 saveHandler 被调用，模拟添加新图片
    // 这里只能断言 saveHandler 被调用，具体图片列表变化需依赖实现
    expect(savedValue, isNotNull);
  });
} 