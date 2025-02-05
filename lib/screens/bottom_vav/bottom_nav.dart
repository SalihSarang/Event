import 'package:event_vault/screens/category_screen/select_category/selecting_catogory.dart';
import 'package:event_vault/screens/event_manager/event_manager/event_manager.dart';
import 'package:event_vault/screens/home/screen_home.dart';
import 'package:event_vault/screens/settings_screen/settings_screen.dart';
import 'package:event_vault/screens/task_screen/task_screen.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

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
    TaskScreen(),
    SettingsScreen(),
  ];
  int myIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppTheme.secondary,
        selectedItemColor: AppTheme.hilite,
        unselectedItemColor: AppTheme.hint,
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
