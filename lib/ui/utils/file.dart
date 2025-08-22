import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class FileUtil {
  static CompressFormat? getCompressFormat(String filePath) {
    var name =
        filePath.substring(filePath.lastIndexOf("/") + 1, filePath.length);
    if (name.endsWith('.jpg') || name.endsWith('.jpeg')) {
      return CompressFormat.jpeg;
    } else if (name.endsWith('.png')) {
      return CompressFormat.png;
    } else if (name.endsWith('.heic')) {
      return CompressFormat.heic;
    } else if (name.endsWith('.webp')) {
      return CompressFormat.webp;
    } else {
      return null;
    }
  }

  /// Convert XFile to MultipartFile, compatible with web and non-web platforms.
  static Future<MultipartFile> xFileToMultipartFile(XFile pickedFile) async {
    if (kIsWeb) {
      final bytes = await pickedFile.readAsBytes();
      return MultipartFile.fromBytes(bytes, filename: pickedFile.name);
    } else {
      return MultipartFile.fromFileSync(pickedFile.path,
          filename: pickedFile.name);
    }
  }
}
