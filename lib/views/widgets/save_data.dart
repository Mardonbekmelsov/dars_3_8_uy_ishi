import 'package:shared_preferences/shared_preferences.dart';

Future<void> saveCheckThemMode(bool checkThemMode) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('checkThemMode', checkThemMode);
  }

Future<void> saveIntefeysColor(
      int checkInterfeysColor, int interfeysColor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('checkInterfeysColor', checkInterfeysColor);
    await prefs.setInt('interfeysColor', interfeysColor);
  }

  Future<void> saveTextColor(int checkTextColor, int textColor) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('checkTextColor', checkTextColor);
    await prefs.setInt('textColor', textColor);
  }

  Future<void> saveTextSize(double textSize) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('textSize', textSize);
  }

  Future<void> saveCheckLanguage(int checkLanguage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('checkLanguage', checkLanguage);
  }

  Future<void> saveBackgroundImageUrl(String backgroundImageUrl) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('backgroundImageUrl', backgroundImageUrl);
  }