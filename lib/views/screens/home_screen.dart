import 'package:dars_3_8_uy_ishi/utils/app_constants.dart';
import 'package:dars_3_8_uy_ishi/views/widgets/custom_drawer.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;

  const HomeScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Future<void> saveCheckLanguage(int checkLanguage) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('checkLanguage', checkLanguage);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppConstants.interfaceColor),
        title: Text(
          "Main Page",
          style: TextStyle(
              fontSize: AppConstants.textSize,
              color: Color(AppConstants.textColor)),
        ),
        actions: [
          DropdownButton(
            borderRadius: BorderRadius.circular(20),
            dropdownColor: Color(AppConstants.interfaceColor),
            menuMaxHeight: 200,
            isDense: true,
            value: AppConstants.checkLanguage,
            items: [
              DropdownMenuItem(
                value: 0,
                child: Text(
                  "Uz",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: Color(AppConstants.textColor)),
                ),
              ),
              DropdownMenuItem(
                value: 1,
                child: Text(
                  "Eng",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: Color(AppConstants.textColor)),
                ),
              ),
              DropdownMenuItem(
                value: 2,
                child: Text(
                  "Ru",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: Color(AppConstants.textColor)),
                ),
              ),
            ],
            onChanged: (value) {
              saveCheckLanguage(value!);
              setState(() {
                AppConstants.checkLanguage = value;
              });
            },
          )
        ],
      ),
      drawer: CustomDrawer(
        onThemeChanged: widget.onThemeChanged,
        onBackgroundImageChanged: widget.onBackgroundImageChanged,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: AppConstants.backgroundImageUrl.isEmpty
              ? null
              : DecorationImage(
                  image: NetworkImage(AppConstants.backgroundImageUrl),
                ),
        ),
      ),
    );
  }
}
