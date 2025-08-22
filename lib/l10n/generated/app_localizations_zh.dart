import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get pleaseEnter => '请输入';

  @override
  String get none => '暂无';

  @override
  String get noData => '暂无数据';

  @override
  String get pleaseSelect => '请选择';

  @override
  String get camera => '拍照';

  @override
  String get gallery => '相册';

  @override
  String get invalidImageFormat => '无效的图片格式!';

  @override
  String unsupportedImagesSkipped(int count) {
    return '$count张图片格式不支持,已跳过';
  }
}
