import 'package:event_vault/database/functions/pending/pending.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/pending_event/pending_event.dart';
import 'package:flutter/material.dart';

class PendingScreen extends StatefulWidget {
  const PendingScreen({super.key});

  @override
  State<PendingScreen> createState() => _PendingScreenState();
}

class _PendingScreenState extends State<PendingScreen> {
  @override
  void initState() {
    super.initState();
    getAllPendings();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
            child: ValueListenableBuilder(
          valueListenable: pendingEventsListener,
          builder: (context, pEvents, child) {
            if (pEvents.isEmpty) {
              return Center(
                child: Text(
                  'No Pending Events',
                  style: myFont(size: 30),
                ),
              );
            }
            return ListView.builder(
              itemCount: pEvents.length,
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
      ),
    );
  }
}
