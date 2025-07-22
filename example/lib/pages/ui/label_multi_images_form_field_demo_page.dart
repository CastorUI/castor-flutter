import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:castor_flutter/ui/form/label_multi_images_form_field.dart';

class LabelMultiImagesFormFieldDemoPage extends StatefulWidget {
  const LabelMultiImagesFormFieldDemoPage({super.key});

  @override
  State<LabelMultiImagesFormFieldDemoPage> createState() => _LabelMultiImagesFormFieldDemoPageState();
}

class _LabelMultiImagesFormFieldDemoPageState extends State<LabelMultiImagesFormFieldDemoPage> {
  List<String> _images = [
    'https://q2.itc.cn/q_70/images03/20241013/47ff05019e93455abd85cd47612fbf7b.jpeg',
    'https://img1.baidu.com/it/u=3089343796,3448258416&fm=253&app=138&f=JPEG?w=500&h=500',
  ];

    Future<String?> _mockUploadHandler(MultipartFile file) async {
    // Simulate upload and return a new image url
    await Future.delayed(const Duration(milliseconds: 500));
    return 'https://q2.itc.cn/q_70/images03/20241013/47ff05019e93455abd85cd47612fbf7b.jpeg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Multi Images Form Field Demo')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LabelMultiImagesFormField(
                label: 'Gallery',
                initialValue: _images,
                saveHandler: (val) {
                  setState(() {
                    _images = (val as List<String>?) ?? [];
                  });
                },
                uploadHandler: _mockUploadHandler,
              ),
              const SizedBox(height: 16),
              Text('Current images: ${_images.length}', style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
} 