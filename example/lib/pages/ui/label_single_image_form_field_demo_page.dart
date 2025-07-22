import 'package:flutter/material.dart';
import 'package:castor_flutter/ui/form/label_single_image_form_field.dart';
import 'package:dio/dio.dart';

class LabelSingleImageFormFieldDemoPage extends StatefulWidget {
  const LabelSingleImageFormFieldDemoPage({super.key});

  @override
  State<LabelSingleImageFormFieldDemoPage> createState() => _LabelSingleImageFormFieldDemoPageState();
}

class _LabelSingleImageFormFieldDemoPageState extends State<LabelSingleImageFormFieldDemoPage> {
  String? _imageUrl = '';

  Future<String?> _mockUploadHandler(MultipartFile file) async {
    // Simulate upload and return a new image url
    await Future.delayed(const Duration(milliseconds: 500));
    return 'https://q2.itc.cn/q_70/images03/20241013/47ff05019e93455abd85cd47612fbf7b.jpeg';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Single Image Form Field Demo')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              LabelSingleImageFormField(
                label: 'Avatar',
                initialValue: _imageUrl,
                saveHandler: (val) {
                  setState(() {
                    _imageUrl = val;
                  });
                },
                uploadHandler: _mockUploadHandler,
              ),
              const SizedBox(height: 16),
              Text('Current image url: $_imageUrl', style: const TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
} 