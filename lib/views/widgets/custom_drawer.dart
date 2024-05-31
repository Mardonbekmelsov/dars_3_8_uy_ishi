import 'package:dars_3_8_uy_ishi/utils/app_constants.dart';
import 'package:dars_3_8_uy_ishi/views/screens/home_screen.dart';
import 'package:dars_3_8_uy_ishi/views/screens/settings_screen.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  const CustomDrawer({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color(AppConstants.interfaceColor),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  "",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: Color(AppConstants.textColor)),
                ),
                Text(
                  "Menu",
                  style: TextStyle(
                      fontSize: AppConstants.textSize,
                      color: Color(AppConstants.textColor)),
                ),
              ],
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return HomeScreen(
                      onThemeChanged: onThemeChanged,
                      onBackgroundImageChanged: onBackgroundImageChanged,
                    );
                  },
                ),
              );
            },
            title: Text(
              "Main Page",
              style: TextStyle(
                  fontSize: AppConstants.textSize,
                  color: Color(AppConstants.textColor)),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return SettingsScreen(
                      onThemeChanged: onThemeChanged,
                      onBackgroundImageChanged: onBackgroundImageChanged,
                    );
                  },
                ),
              );
            },
            title: Text(
              "Settings",
              style: TextStyle(
                  fontSize: AppConstants.textSize,
                  color: Color(AppConstants.textColor)),
            ),
            trailing: const Icon(
              Icons.keyboard_arrow_right,
            ),
          ),
        ],
      ),
    );
  }
}
