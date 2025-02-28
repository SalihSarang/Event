import 'package:event_vault/screens/settings_screen/privacy_policy.dart';
import 'package:event_vault/screens/settings_screen/terms_and_conditions.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      persistentFooterButtons: [
        SizedBox(
          height: 60,
          child: Center(
            child: Column(
              children: [
                Text(
                  'By using this app, you agree to our',
                  style: myFontColor(size: 15),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PrivacyPolicyScreen(),
                          )),
                      child: Text(
                        'Privacy Policy',
                        style: myFontColor(color: AppTheme.hilite, size: 15)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                    SizedBox(width: 5),
                    Text(
                      'and',
                      style: myFontColor(size: 15),
                    ),
                    SizedBox(width: 5),
                    InkWell(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  TermsAndConditionsScreen())),
                      child: Text(
                        'Terms & Conditions',
                        style: myFontColor(color: AppTheme.hilite, size: 15)
                            .copyWith(decoration: TextDecoration.underline),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
      backgroundColor: AppTheme.secondary,
      appBar: CustomAppBar(title: 'About Us'),
      floatingActionButton: Text('Version: 1.0',
          style: myFontColor(size: 18), textAlign: TextAlign.center),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Event Vault',
                    style: appNamefont(size: 55), textAlign: TextAlign.center),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Event Vault is an offline app designed for event organizers and '
                    'company managers to efficiently track multiple events, clients, '
                    'budgets, and schedules without an internet connection.',
                    style: myFontColor(size: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
