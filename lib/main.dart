import 'package:dars_3_8_uy_ishi/utils/app_constants.dart';
import 'package:dars_3_8_uy_ishi/views/screens/home_screen.dart';
import 'package:dars_3_8_uy_ishi/views/widgets/save_data.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    _loadData();
    super.initState();
  }

  Future<void> _loadData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    AppConstants.checkThemMode = prefs.getBool('checkThemMode')!;
    toggleThemeMode(prefs.getBool('checkThemMode')!);
    AppConstants.backgroundImageUrl = prefs.getString('backgroundImageUrl')!;
    AppConstants.checkLanguage = prefs.getInt('checkLanguage')!;
    AppConstants.textSize = prefs.getDouble('textSize')!;
    AppConstants.textColor = prefs.getInt('textColor')!;
    print(prefs.getInt('textColor'));
    AppConstants.interfaceColor = prefs.getInt('interfeysColor')!;
    AppConstants.checkTextColor = prefs.getInt('checkTextColor')!;
    AppConstants.checkInterfaceColor = prefs.getInt('checkInterfeysColor')!;
    setState(() {});
  }

  void toggleThemeMode(bool value) {
    saveCheckThemMode(value);
    AppConstants.checkThemMode = value;
    AppConstants.themeMode = value ? ThemeMode.dark : ThemeMode.light;
    setState(() {});
  }

  void changeBackgroundImage(String imageUrl) {
    if (imageUrl.trim().isNotEmpty) {
      AppConstants.backgroundImageUrl = imageUrl;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amber,
        ),
      ),
      darkTheme: ThemeData.dark(),
      themeMode: AppConstants.checkThemMode ? ThemeMode.dark : ThemeMode.light,
      home: HomeScreen(
          onThemeChanged: toggleThemeMode,
          onBackgroundImageChanged: changeBackgroundImage),
    );
  }
}
