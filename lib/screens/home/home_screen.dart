import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/screens/category_screen/select_category/selecting_catogory.dart';
import 'package:event_vault/screens/event_manager/event_manager/event_manager.dart';
import 'package:event_vault/screens/home/screen_home.dart';
import 'package:event_vault/screens/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<BottomNavigation> {
  List<Widget> screenList = [
    HomeScreen(),
    ScreenEventManager(),
    SelectingCategory(),
    Center(
        child: Text('Task',
            style: TextStyle(
                color: const Color.fromARGB(255, 0, 0, 0), fontSize: 24))),
    SettingsScreen(),
  ];
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: ColorPalette.secondary,
        selectedItemColor: ColorPalette.hilite,
        unselectedItemColor: ColorPalette.hint,
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
