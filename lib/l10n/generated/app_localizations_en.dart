import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get pleaseEnter => 'Please enter';

  @override
  String get none => 'None';

  @override
  String get noData => 'No data';

  @override
  String get pleaseSelect => 'Please select';

  @override
  String get camera => 'Camera';

  @override
  String get gallery => 'Gallery';

  @override
  String get invalidImageFormat => 'Invalid image format!';

  @override
  String unsupportedImagesSkipped(int count) {
    return '$count image(s) are not supported and were skipped';
  }
}
