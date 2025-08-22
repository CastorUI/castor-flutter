import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'pages/ui/ui_index_page.dart';
import 'pages/core/core_index_page.dart';
import 'package:castor_flutter/l10n/l10n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'pages/settings/language_page.dart';
import 'widgets/web_wrapper.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Default: follow system language. Use menu to switch to English or Chinese explicitly.
  Locale? _locale;

  void _setLocale(Locale? locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'castor_flutter Example',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          // 统一页面切换效果：采用垂直向上滑入（上下切换）
          pageTransitionsTheme: const PageTransitionsTheme(
            builders: <TargetPlatform, PageTransitionsBuilder>{
              TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
              TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
            },
          ),
        ),
        locale: _locale,
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: AppLocalizations.supportedLocales,
        home: kIsWeb
            ? WebWrapper(
                child: ExampleHomePage(
                onLocaleChange: _setLocale,
                currentLocale: _locale,
              ))
            : ExampleHomePage(
                onLocaleChange: _setLocale,
                currentLocale: _locale,
              ));
  }
}

class ExampleHomePage extends StatefulWidget {
  const ExampleHomePage({
    super.key,
    required this.onLocaleChange,
    required this.currentLocale,
  });

  final ValueChanged<Locale?> onLocaleChange;
  final Locale? currentLocale; // null -> system

  @override
  State<ExampleHomePage> createState() => _ExampleHomePageState();
}

class _ExampleHomePageState extends State<ExampleHomePage> {
  int _selectedIndex = 0;

  static final List<Widget> _pages = <Widget>[
    const UIIndexPage(),
    const CoreIndexPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('castor_flutter Example'),
        actions: [
          IconButton(
            tooltip: 'Language',
            icon: const Icon(Icons.language),
            onPressed: () {
              final current = widget.currentLocale == null
                  ? 'system'
                  : widget.currentLocale!.languageCode;
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => kIsWeb
                      ? WebWrapper(
                          child: LanguageSelectionPage(
                          currentCode: current,
                          onSelected: _handleLocaleChange,
                        ))
                      : LanguageSelectionPage(
                          currentCode: current,
                          onSelected: _handleLocaleChange,
                        ),
                ),
              );
            },
          ),
        ],
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.widgets),
            label: 'UI组件',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate),
            label: '类库',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }

  void _handleLocaleChange(value) {
    switch (value) {
      case 'system':
        widget.onLocaleChange(null);
        break;
      case 'en':
        widget.onLocaleChange(const Locale('en'));
        break;
      case 'zh':
        widget.onLocaleChange(const Locale('zh'));
        break;
    }
  }
}
