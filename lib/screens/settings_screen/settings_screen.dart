import 'package:event_vault/costum_widgets/settings_options.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Center(
            child: Text(
              "Settings",
              style: GoogleFonts.roboto(
                color: Colors.white,
                fontWeight: FontWeight.w800,
                fontSize: 40,
              ),
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: ListView(
            children: [
              Text(
                "General Settings",
                style: GoogleFonts.roboto(
                  color: Colors.white,
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
