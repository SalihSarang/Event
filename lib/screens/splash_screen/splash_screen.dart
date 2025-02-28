import 'dart:async';
import 'package:event_vault/database/open_box/open_box.dart';
import 'package:event_vault/screens/bottom_vav/bottom_nav.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double progressValue = 0.0;
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _startLoading();
  }

  Future<void> _startLoading() async {
    await openDataBaseBox();

    _timer = Timer.periodic(Duration(milliseconds: 50), (timer) {
      if (progressValue >= 1.0) {
        timer.cancel();
        _navigateToNextScreen();
      } else {
        setState(() {
          progressValue += 0.02;
        });
      }
    });
  }

  void _navigateToNextScreen() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => BottomNavigation()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Event Vault',
                style: TextStyle(
                  fontSize: 60,
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: [Colors.black, AppTheme.hilite],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ).createShader(Rect.fromLTWH(0.0, 0.0, 300, 100)),
                ),
              ),
            ),
            SizedBox(height: 20),
            Center(
              child: SizedBox(
                height: 8,
                width: 350,
                child: LinearProgressIndicator(
                  borderRadius: BorderRadius.circular(20),
                  value: progressValue,
                  backgroundColor: Colors.grey[700],
                  valueColor: AlwaysStoppedAnimation<Color>(AppTheme.hilite),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
