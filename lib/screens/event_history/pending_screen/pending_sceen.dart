import 'package:event_vault/database/functions/add_pending/add_pending.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/pending_event/pending_event.dart';
import 'package:flutter/material.dart';

class PendingScreen extends StatelessWidget {
  const PendingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Pending Event'),
      body: SafeArea(
          child: ValueListenableBuilder(
        valueListenable: pendingEventsListener,
        builder: (context, pEvents, child) {
          if (pEvents.isEmpty) {
            return Text(
              'No Pending Events',
              style: myFont(size: 30),
            );
          }
          return ListView.builder(
            itemBuilder: (context, index) {
              final pEvent = pEvents[index];
              final event = pEvent.event;
              return PendingEventCard(
                detailPageImg: event.image,
                event: event,
                pEvent: pEvent,
              );
            },
          );
        },
      )),
    );
  }
}
