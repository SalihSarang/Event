import 'package:event_vault/database/functions/add_completed/add_completed.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/event_history/event_history_widgets.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class EventHistory extends StatefulWidget {
  const EventHistory({super.key});

  @override
  State<EventHistory> createState() => _EventHistoryState();
}

class _EventHistoryState extends State<EventHistory> {
  @override
  void initState() {
    super.initState();
    getAllCompletedEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: ValueListenableBuilder(
            valueListenable: completedEvents,
            builder: (context, events, child) {
              if (events.isEmpty) {
                return Center(
                  child: Center(
                    child: Text(
                      "No Completed Events",
                      style: myFont(size: 30),
                    ),
                  ),
                );
              }
              return ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final completedEvent = events[index];
                  final event = completedEvent.event;
                  developer.log(event.eventName);
                  return EventHistoryCard(
                    detailPageImg: event.image,
                    completedEvent: completedEvent,
                    event: event,
                  );
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
