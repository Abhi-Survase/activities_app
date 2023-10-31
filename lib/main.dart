import 'package:flutter/material.dart';
import 'fundamentalscreen.dart';
import 'cumulativescreen.dart';

void main() {
  runApp(const MyApp());
}

bool lighttheme = true;
var currentTheme = ThemeMode.light;
final kColorScheme = ColorScheme.fromSeed(seedColor: Colors.blue[500]!);
final kDarkColorScheme = ColorScheme.fromSeed(
    brightness: Brightness.dark, seedColor: Colors.blue[800]!);

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() {
    return _MyApp();
  }
}

class _MyApp extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  void changeTheme(ThemeMode themeMode) {
    setState(
      () {
        _themeMode = themeMode;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData().copyWith(
        colorScheme: kColorScheme,
        useMaterial3: true,
        scaffoldBackgroundColor: kColorScheme.background,
      ),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorScheme,
        scaffoldBackgroundColor: kDarkColorScheme.background,
      ),
      themeMode: _themeMode,
      title: 'Activities App',
      home: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                  onPressed: () {
                    if (lighttheme == true) {
                      currentTheme = ThemeMode.dark;
                      lighttheme = false;
                    } else if (lighttheme == false) {
                      currentTheme = ThemeMode.light;
                      lighttheme = true;
                    }
                    changeTheme((currentTheme));
                  },
                  icon: const Icon(Icons.dark_mode))
            ],
            backgroundColor: kColorScheme.primary,
            foregroundColor: kColorScheme.onPrimary,
            title: const Text('Activities App', style: TextStyle(fontSize: 26)),
            bottom: TabBar(
              indicatorSize: TabBarIndicatorSize.tab,
              indicator: const ShapeDecoration(
                shape: UnderlineInputBorder(
                  borderSide: BorderSide(
                    width: 3.5,
                    color: Colors.amber,
                  ),
                ),
              ),
              dividerColor: kColorScheme.onError,
              tabs: [
                Tab(
                  icon: Icon(Icons.calculate, color: kColorScheme.onPrimary),
                ),
                Tab(
                  icon: Icon(Icons.calculate_outlined,
                      color: kColorScheme.onPrimary),
                )
              ],
            ),
          ),
          body: const TabBarView(
            clipBehavior: Clip.antiAlias,
            children: [
              FundaScreen(),
              CumuScreen(),
            ],
          ),
        ),
      ),
    );
  }
}
