import 'package:event_vault/database/functions/event/event.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/event_history/event_history_widgets.dart';
import 'package:event_vault/widgets/home_screen/home_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EventAddModal> upcomingEvents = [];

  fetchUpcomingEvents() {
    List<EventAddModal> events = getUpcomingEvents();
    setState(() {
      upcomingEvents = events;
    });
  }

  @override
  void initState() {
    super.initState();
    fetchUpcomingEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      appBar: CustomAppBar(title: "Dashboard"),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     LocalNotificationService.sendSimpleNotification();
      //     log('Notification');
      //   },
      // ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text('Upcoming Events', style: myFont(size: 25)),
            tabBar(upcomingEvents),
            SizedBox(height: 20),
            homeScreenCard(context: context),
            SizedBox(height: 10),
            profitCard()
          ],
        ),
      ),
    );
  }
}
