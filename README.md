# castor_flutter

A Flutter component and utility library for rapid development.

## Features

- Reusable UI components (Button, Input, etc.)
- Core utility classes
- Easy-to-use API

## Getting started

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  castor_flutter:
    path: ../castor_flutter # or use the published version
```

Run:

```sh
flutter pub get
```

## Usage

Import and use any component or utility:

```dart
import 'package:castor_flutter/castor_flutter.dart';

// Use a button
CastorButton(label: 'Click', onPressed: () {});

// Use an input
CastorInput(label: 'Enter text');

// Use a labeled input form field
LabelInputFormField(
  label: 'Username',
  initialValue: '',
  saveHandler: (val) {
    // handle value
  },
);

// Use a labeled select form field
LabelSelectFormField(
  label: 'Fruit',
  initialValue: 1,
  options: {1: 'Apple', 2: 'Banana', 3: 'Orange'},
  saveHandler: (val) {
    // handle value
  },
);

// Use a labeled switch form field
LabelSwitchFormField(
  label: 'Enable feature',
  initialValue: TupleEntity(true, 'On'),
  saveHandler: (val) {
    // handle value
  },
);

// Use a labeled multiline input form field
LabelMultilineInputFormField(
  label: 'Description',
  initialValue: '',
  saveHandler: (val) {
    // handle value
  },
  maxLines: 4,
);

// Use a labeled single image form field
LabelSingleImageFormField(
  label: 'Avatar',
  initialValue: 'https://example.com/avatar.png',
  saveHandler: (val) {
    // handle value
  },
  uploadHandler: (file) async => 'https://example.com/avatar.png',
);

// Use a labeled multi images form field
LabelMultiImagesFormField(
  label: 'Gallery',
  initialValue: [
    'https://via.placeholder.com/80?text=1',
    'https://via.placeholder.com/80?text=2',
  ],
  saveHandler: (val) {
    // handle value
  },
);

// Use a utility class
final result = Calculator().addOne(2);
```

## HarmonyOS Support

This plugin supports HarmonyOS. When running in a HarmonyOS environment, add the following dependency overrides to your App project's `pubspec.yaml`:

```yaml
# HarmonyOS 6 dependency overrides
dependency_overrides:
  # System picker: calls HarmonyOS native picker and camera
  image_picker:
    git:
      url: https://gitee.com/openharmony-sig/flutter_packages.git
      path: packages/image_picker/image_picker
      ref: master
```

## Internationalization (i18n)

This library supports Chinese and English via Flutter's gen_l10n (intl/ARB) workflow.

### Setup in your app

1) Add Flutter localization delegates and supported locales to your MaterialApp:

```dart
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:castor_flutter/castor_flutter.dart'; // exports AppLocalizations

MaterialApp(
  // ...existing code...
  localizationsDelegates: const [
    AppLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ],
  supportedLocales: AppLocalizations.supportedLocales,
  // Optional: Force a locale
  // locale: const Locale('zh'),
);
```

2) Components use localized strings automatically via `AppLocalizations.of(context)`.

### Add or modify translations

- Edit the ARB files in `lib/l10n/`:
  - `app_en.arb` (English)
  - `app_zh.arb` (Chinese)
- Then generate localizations:

```sh
flutter gen-l10n
```

Generated files are placed in `lib/l10n/generated/`.

### Notes

- The package exports `AppLocalizations` via `l10n/l10n.dart`, so you only need `import 'package:castor_flutter/castor_flutter.dart';`.
- If you add new keys to ARB, re-run `flutter gen-l10n` before building/running.
- The components currently use keys like: `pleaseEnter`, `none`, `noData`, `pleaseSelect`, `camera`, `gallery`, `invalidImageFormat`, and `unsupportedImagesSkipped(count)`.

## Live Demo

The project has been deployed. Experience it online here: [castor_flutter Component Library Demo](https://castorui.github.io/castor-flutter-help/)

## Example app

This package provides a full-featured example app under the `example/` directory.

### Directory structure

```text
example/
  main.dart                # Entry point
  ui/
    button_demo_page.dart  # Button component demo
    input_demo_page.dart   # Input component demo
  core/
    demo_page.dart         # Core utility demo
```

### How to run

**Web:**

```sh
flutter run -d chrome -t example/main.dart
```

**Mobile (Android/iOS):**

```sh
flutter run -t example/main.dart
```

**VSCode:**

- 打开“运行和调试”面板，选择 `Flutter Web: example/main.dart`，点击启动。

### Best practices

- 示例页面结构与 `lib/` 目录保持一致，便于查找和维护。
- 每个组件/功能有独立的演示页面。
- 入口页面通过底部导航栏切换不同演示。
- 示例页面有交互和注释，便于理解。

## Contributing

Feel free to open issues or submit pull requests. For major changes, please open an issue first to discuss what you would like to change.

## License

[MIT](LICENSE)
