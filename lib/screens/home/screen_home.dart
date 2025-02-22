import 'dart:developer';
import 'package:event_vault/screen_function/event_manager/event_manager_fn.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:event_vault/database/functions/event/event.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/notification_fn/event_remainder.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/event_history/event_history_widgets.dart';
import 'package:event_vault/widgets/home_screen/home_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<EventAddModal> upcomingEvents = [];

  Future<void> fetchUpcomingEvents() async {
    // log("fetchUpcomingEvents() started");

    // var status = await Permission.notification.status;
    // log("Notification permission status: $status");

    // if (status.isDenied || status.isPermanentlyDenied) {
    //   await Permission.notification.request();
    //   log("Requesting notification permission...");
    //   return;
    // }

    List<EventAddModal> events = getUpcomingEvents();
    log("Fetched ${events.length} upcoming events");

    setState(() {
      upcomingEvents = events;
    });

    // for (var event in events) {
    //   DateTime eventDateTime = combineDateAndTime(event.date, event.time);
    //   DateTime reminderTime = eventDateTime.subtract(const Duration(hours: 1));

    //   if (reminderTime.isAfter(DateTime.now())) {
    //     log("Scheduling notification for: ${event.eventName}");
    //     LocalNotificationService.cancelNotification(int.parse(event.eventId));
    //     await LocalNotificationService.scheduleNotification(
    //       id: int.parse(event.eventId),
    //       title: "Reminder: ${event.eventName}",
    //       body: "Starts at ${event.date}",
    //       scheduledTime: reminderTime,
    //     );
    //   }
    // }

    // log("fetchUpcomingEvents() completed");
  }

  // Future<void> testNotification() async {
  //   var status = await Permission.notification.status;
  //   if (status.isDenied || status.isPermanentlyDenied) {
  //     await Permission.notification.request();
  //     log("Requesting notification permission...");
  //     return;
  //   }

  //   await LocalNotificationService.showInstantNotification();
  //   log('Test Notification Sent');
  // }

  @override
  void initState() {
    super.initState();
    log("HomeScreen initState() called");

    log("Calling fetchUpcomingEvents()");
    fetchUpcomingEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(25, 26, 37, 1),
      appBar: const CustomAppBar(title: "Dashboard"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Text('Upcoming Events', style: myFont(size: 25)),
            tabBar(upcomingEvents),
            const SizedBox(height: 20),
            homeScreenCard(context: context),
            const SizedBox(height: 10),
            profitCard(),
          ],
        ),
      ),
    );
  }
}
