import 'package:flutter/material.dart';

// 文本样式
class AppTextStyle {
  /// 表单字段标签
  static const formLabel = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w500,
      color: Color.fromRGBO(26, 26, 26, 1));

  static const formLabelRequired =
      TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500, color: Colors.red);

  /// 表单字段文本
  static const formText = TextStyle(
      fontSize: 14.0,
      fontWeight: FontWeight.w400,
      color: Color.fromRGBO(26, 26, 26, 1));

  static const formLightGrayText =
      TextStyle(color: Color.fromRGBO(204, 204, 204, 1), fontSize: 14);
}
