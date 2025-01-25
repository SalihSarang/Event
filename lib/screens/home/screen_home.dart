import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
        appBar: CustomAppBar(title: "Dashboard")
    );
  }
}
