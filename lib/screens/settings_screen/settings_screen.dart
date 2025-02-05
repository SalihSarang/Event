import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:event_vault/widgets/settings_options/settings_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

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
              Text(
                "General Settings",
                style: GoogleFonts.roboto(
                  color: AppTheme.textW,
                  fontWeight: FontWeight.w800,
                  fontSize: 30,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              settingsOptions(
                  leadIcon: Icon(
                    Icons.notifications_none,
                    color: Colors.white,
                    size: 35,
                  ),
                  title: 'Notification',
                  subTitle: 'Manage Notification')
            ],
          ),
        ),
      ),
    );
  }
}
