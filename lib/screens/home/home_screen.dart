import 'package:event_vault/screens/add_event/add_category_items/selecting_catogory.dart';
import 'package:event_vault/screens/event_manager/event_manager/event_manager.dart';
import 'package:event_vault/screens/home/screen_home.dart';
import 'package:event_vault/screens/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';

class ScreenMain extends StatefulWidget {
  const ScreenMain({super.key});

  @override
  State<ScreenMain> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenMain> {
  List<Widget> screenList = [
    HomeScreen(),
    ScreenEventManager(),
    SelectingCategory(),
    Center(
        child:
            Text('Task',
            style: TextStyle(color: Colors.white, fontSize: 24))),
    SettingsScreen(),
  ];
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color.fromRGBO(32, 34, 54, 1),
        selectedItemColor: Color.fromRGBO(59, 121, 255, 1),
        unselectedItemColor: Color.fromRGBO(152, 152, 159, 1),
        iconSize: 30,
        onTap: (index) {
          setState(() {
            myIndex = index;
          });
        },
        currentIndex: myIndex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home_filled), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.event), label: 'Events'),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle_outline), label: 'New'),
          BottomNavigationBarItem(
              icon: Icon(Icons.task_outlined), label: 'Task'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
        ],
      ),
      body: SafeArea(
        child: screenList[myIndex],
      ),
    );
  }
}
