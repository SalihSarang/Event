import 'dart:developer';

import 'package:event_vault/database/functions/completed/completed.dart';
import 'package:event_vault/screens/event_history/history_main/history_main.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

Widget eventCompleted({required BuildContext context}) {
  return ValueListenableBuilder(
    valueListenable: completedEvents,
    builder: (context, completed, child) {
      final count = completedEventsBox.length;
      return Container(
        width: double.infinity,
        height: 200,
        decoration: BoxDecoration(
            color: AppTheme.secondary, borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              count.toString(),
              style: myFont(size: 35),
            ),
            Text(
              'Completed Event',
              style: myFont(size: 25),
            ),
            TextButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HistoryMain(),
                  ));
                },
                child: Text(
                  'Event History',
                  style: myFont(size: 20),
                ))
          ],
        ),
      );
    },
  );
}
