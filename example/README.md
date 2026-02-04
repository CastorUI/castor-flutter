# castor_flutter Example

A comprehensive example app demonstrating the features of the **castor_flutter** package.

## Overview

This example showcases:

- **UI Components**: LabelInputFormField, LabelSelectFormField, LabelSwitchFormField, LabelMultilineInputFormField, LabelSingleImageFormField, LabelMultiImagesFormField
- **Core Utilities**: Calculator and other utility classes
- **Internationalization (i18n)**: Support for Chinese and English with language switching
- **Platform Support**: Web, Mobile (Android/iOS), and HarmonyOS

## Features

- Clean component demos with interactive examples
- Bottom navigation bar to switch between UI and Core sections
- Language selection (System/English/Chinese)
- Cross-platform support (Web, Mobile, Desktop)
- HarmonyOS native image picker integration

## Project Structure

```
lib/
  main.dart                           # App entry point
  pages/
    ui/
      ui_index_page.dart              # UI components demo index
      label_input_form_field_demo_page.dart
      label_select_form_field_demo_page.dart
      label_switch_form_field_demo_page.dart
      label_multiline_input_form_field_demo_page.dart
      label_single_image_form_field_demo_page.dart
      label_multi_images_form_field_demo_page.dart
    core/
      core_index_page.dart             # Core utilities demo index
      calculator_demo_page.dart
    settings/
      language_page.dart               # Language selection
  widgets/
    web_wrapper.dart                   # Web platform wrapper
```

## Getting Started

### Prerequisites

- Flutter SDK >= 3.0.0
- Dart >= 3.0.0

### Installation

1. Navigate to the example directory:

```bash
cd example
```

2. Get dependencies:

```bash
flutter pub get
```

### Running the App

**Web:**

```bash
flutter run -d chrome
```

**Mobile (Android/iOS):**

```bash
flutter run
```

**VSCode:**

- Open the "Run and Debug" panel
- Select `Flutter: example/main.dart`
- Click the start button

## Usage

The example app demonstrates how to use castor_flutter components:

### UI Components Section

Navigate to the **UI组件** tab to explore:

- **Input Form Field**: Text input with label validation
- **Select Form Field**: Dropdown selection
- **Switch Form Field**: Boolean toggle with label
- **Multiline Input**: Multi-line text input
- **Single Image Field**: Image picker and preview
- **Multi Images Field**: Multiple image management

### Core Utilities Section

Navigate to the **类库** tab to explore:

- **Calculator**: Basic arithmetic utilities
- Additional utility classes

### Language Switching

Click the **Language** icon (🌐) in the app bar to:

- Follow system language
- Switch to English explicitly
- Switch to Chinese (中文) explicitly

## Key Files

- [main.dart](lib/main.dart) - App setup with localization and navigation
- [ui_index_page.dart](lib/pages/ui/ui_index_page.dart) - UI components gallery
- [core_index_page.dart](lib/pages/core/core_index_page.dart) - Core utilities demo
- [language_page.dart](lib/pages/settings/language_page.dart) - Language selection
- [pubspec.yaml](pubspec.yaml) - Dependencies configuration

## Dependencies

- `castor_flutter` - Main package from parent directory
- `dio` - HTTP client for API requests
- `flutter_localizations` - i18n support
- `intl` - Internationalization library

## HarmonyOS Support

The app includes HarmonyOS 6 support with native image picker integration via dependency overrides (see `pubspec.yaml`).

## Notes

- Page transitions use fade-upwards animation across all platforms
- Localization follows Flutter's gen_l10n workflow
- Each component has a dedicated demo page for easy understanding
- The app maintains structure consistency with the main package

## Related

- [castor_flutter Package](../) - Main component library
- [Live Demo](https://castorui.github.io/castor-flutter-help/)
- [Flutter Documentation](https://docs.flutter.dev/)
