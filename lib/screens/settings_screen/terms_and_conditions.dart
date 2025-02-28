import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Terms and Conditions"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    "Welcome to Event Vault! These Terms and Conditions govern your use of the Event Vault app. By using the app, you agree to comply with these terms.\n\n"
                    "1. Acceptance of Terms\n"
                    "By accessing or using Event Vault, you agree to these Terms and Conditions.\n\n"
                    "2. Privacy and Data Usage\n"
                    "Event Vault does not collect, store, or share personal data.\n\n"
                    "3. Limitation of Liability\n"
                    "We are not responsible for any missed events or incorrect notifications.\n\n"
                    "4. Changes to Terms\n"
                    "We may update these Terms and Conditions from time to time.",
                    style: myFontColor(size: 19),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
