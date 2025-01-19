import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Center(
            child: Text(
              "Dashboard",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      ),
    );
  }
}
