import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Privacy Policy"),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10),
              buildSectionTitle("1. Information We Collect"),
              buildParagraph(
                  "• We do not collect personal data. All data is stored locally."),
              buildParagraph(
                  "• Event details and notifications are saved only on your device."),
              SizedBox(height: 10),
              buildSectionTitle("2. How We Use Your Information"),
              buildParagraph("• To manage events and schedule reminders."),
              buildParagraph(
                  "• No data is shared or sent to external servers."),
              SizedBox(height: 10),
              buildSectionTitle("3. Data Storage & Security"),
              buildParagraph("• All data is stored on your device."),
              buildParagraph("• You have full control over your event data."),
              SizedBox(height: 10),
              buildSectionTitle("4. Third-Party Services"),
              buildParagraph(
                  "• The app uses local notifications and timezone settings."),
              buildParagraph("• No third-party services collect user data."),
              SizedBox(height: 10),
              buildSectionTitle("5. Your Rights & Choices"),
              buildParagraph("• You can delete or edit events anytime."),
              buildParagraph("• Notifications can be disabled in settings."),
              SizedBox(height: 10),
              buildSectionTitle("6. Changes to This Policy"),
              buildParagraph("• We may update this policy from time to time."),
              buildParagraph("• Any changes will be displayed in the app."),
              buildSectionTitle("7. Contact Us"),
              buildParagraph("If you have any questions, contact us at:"),
              SizedBox(height: 10),
              Text("email : sarangsalih@gmail.com",
                  style: myFontColor(size: 18)),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Text(
        title,
        style: myFontColor(size: 21),
      ),
    );
  }

  Widget buildParagraph(String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Text(
        text,
        style: myFontColor(size: 18),
      ),
    );
  }
}
