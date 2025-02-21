import 'package:event_vault/screens/settings_screen/about_screen.dart';
import 'package:event_vault/screens/settings_screen/profile_screen.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:event_vault/widgets/settings_options/settings_options.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppTheme.mainBg,
      appBar: CustomAppBar(title: "Settings"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: ListView(
            children: [
              Text("General Settings", style: myFontColor(size: 30)),
              SizedBox(
                height: 20,
              ),
              settingsOptions(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ProfileScreen()));
                  },
                  leadIcon: Icon(Icons.person, color: AppTheme.textW, size: 47),
                  title: 'Profile'),
              settingsOptions(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AboutScreen()));
                  },
                  leadIcon: Icon(Icons.info_outline_rounded,
                      color: Colors.white, size: 40),
                  title: 'About Us'),
            ],
          ),
        ),
      ),
    );
  }
}
