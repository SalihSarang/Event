import 'package:event_vault/database/functions/completed/completed.dart';
import 'package:event_vault/database/functions/event_profit/event_profit.dart';
import 'package:event_vault/widgets/empty_list_handling/empty_list_handling.dart';
import 'package:event_vault/widgets/event_history/event_history_widgets.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

class CompletedEvents extends StatefulWidget {
  const CompletedEvents({super.key});

  @override
  State<CompletedEvents> createState() => _CompletedEventsState();
}

class _CompletedEventsState extends State<CompletedEvents> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getAllCompletedEvents();
    });
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
                  child:
                      Center(child: emptyList(message: 'No Events Completed')),
                );
              }
              return ListView.builder(
                itemCount: events.length,
                itemBuilder: (context, index) {
                  final completedEvent = events[index];
                  final event = completedEvent.event;
                  final profit = getProfitByEventId(event.eventId);
                  developer.log(event.eventName);
                  return EventHistoryCard(
                    profit: profit,
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
