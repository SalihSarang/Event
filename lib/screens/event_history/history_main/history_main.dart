import 'package:event_vault/screens/event_history/event_completed/event_history.dart';
import 'package:event_vault/screens/event_history/pending_screen/pending_sceen.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:flutter/material.dart';

class HistoryMain extends StatelessWidget {
  const HistoryMain({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: CustomAppBarHistory(title: 'Event History'),
        body: SafeArea(
          child: TabBarView(children: [
            CompletedEvents(),
            PendingScreen(),
          ]),
        ),
      ),
    );
  }
}
