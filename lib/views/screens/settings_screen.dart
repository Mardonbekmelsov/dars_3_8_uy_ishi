import 'package:dars_3_8_uy_ishi/utils/app_constants.dart';
import 'package:dars_3_8_uy_ishi/views/widgets/custom_drawer.dart';
import 'package:dars_3_8_uy_ishi/views/widgets/save_data.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final ValueChanged<bool> onThemeChanged;
  final ValueChanged<String> onBackgroundImageChanged;
  const SettingsScreen({
    super.key,
    required this.onThemeChanged,
    required this.onBackgroundImageChanged,
  });

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final imageController = TextEditingController();
  final _textColors = [
    0xffFA0808,
    0xff01C8E3,
    0xff01E350,
    0xff060606,
  ];
  final _interfaceColors = [
    0xffFFC300,
    0xff9F1BEA,
    0xff0906CE,
  ];

  @override
  void dispose() {
    imageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(AppConstants.interfaceColor),
        title: Text(
          "Settings",
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
          ),
          IconButton(
            onPressed: () {
              saveBackgroundImageUrl(imageController.text);
              String imageUrl = imageController.text;
              imageController.clear();
              widget.onBackgroundImageChanged(imageUrl);
            },
            icon: const Icon(Icons.save),
          ),
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
        child: ListView(
          children: [
            SwitchListTile(
              value: AppConstants.themeMode == ThemeMode.dark,
              onChanged: widget.onThemeChanged,
              title: Text(
                "Tungi holat",
                style: TextStyle(
                    fontSize: AppConstants.textSize,
                    color: Color(AppConstants.textColor)),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TextField(
                controller: imageController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(), hintText: "image url..."),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Text(
                    'Text Size : ${AppConstants.textSize}',
                    style: TextStyle(
                        fontSize: AppConstants.textSize,
                        color: Color(AppConstants.textColor)),
                  ),
                  Slider(
                    value: AppConstants.textSize,
                    min: 14,
                    max: 30,
                    divisions: 16,
                    label: AppConstants.textSize.round().toString(),
                    onChanged: (double value) {
                      saveTextSize(value);
                      setState(() {
                        AppConstants.textSize = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Text Color: ',
                      style: TextStyle(
                          fontSize: AppConstants.textSize,
                          color: Color(AppConstants.textColor)),
                    ),
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(20),
                    dropdownColor: Color(AppConstants.interfaceColor),
                    menuMaxHeight: 200,
                    isDense: true,
                    value: AppConstants.checkTextColor,
                    items: [
                      DropdownMenuItem(
                        value: 0,
                        child: Container(
                          color: Colors.red,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Container(
                          color: Colors.blue,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Container(
                          color: Colors.green,
                        ),
                      ),
                      DropdownMenuItem(
                        value: 3,
                        child: Container(
                          width: 100,
                          color: Colors.black,
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      AppConstants.checkTextColor = value!;
                      saveTextColor(
                          value, _textColors[AppConstants.checkTextColor]);
                      setState(() {
                        AppConstants.textColor =
                            _textColors[AppConstants.checkTextColor];
                      });
                    },
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      'Interface Color: ',
                      style: TextStyle(
                          fontSize: AppConstants.textSize,
                          color: Color(AppConstants.textColor)),
                    ),
                  ),
                  DropdownButton(
                    borderRadius: BorderRadius.circular(20),
                    dropdownColor: Color(AppConstants.interfaceColor),
                    menuMaxHeight: 200,
                    isDense: true,
                    value: AppConstants.checkInterfaceColor,
                    items: [
                      DropdownMenuItem(
                        value: 0,
                        child: Text(
                          "amber",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: Color(AppConstants.textColor)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 1,
                        child: Text(
                          "purple",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: Color(AppConstants.textColor)),
                        ),
                      ),
                      DropdownMenuItem(
                        value: 2,
                        child: Text(
                          "blue",
                          style: TextStyle(
                              fontSize: AppConstants.textSize,
                              color: Color(AppConstants.textColor)),
                        ),
                      ),
                    ],
                    onChanged: (value) {
                      AppConstants.checkInterfaceColor = value!;
                      saveIntefeysColor(value,
                          _interfaceColors[AppConstants.checkInterfaceColor]);
                      setState(() {
                        AppConstants.interfaceColor =
                            _interfaceColors[AppConstants.checkInterfaceColor];
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
