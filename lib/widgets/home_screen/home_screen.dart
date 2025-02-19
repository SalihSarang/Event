import 'package:event_vault/database/functions/completed/completed.dart';
import 'package:event_vault/database/functions/event_profit/event_profit.dart';
import 'package:event_vault/screens/event_history/history_main/history_main.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

Widget homeScreenCard({required BuildContext context}) {
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

profitCard() {
  return ValueListenableBuilder(
    valueListenable: eventProfitListener,
    builder: (context, value, child) {
      return SizedBox(
        height: 200,
        width: double.infinity,
        child: Card(
          color: AppTheme.secondary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(calculateTotalProfit().toString(),
                  style: myFontColor(size: 25)),
              Text('Total Profit', style: myFontColor(size: 30)),
            ],
          ),
        ),
      );
    },
  );
}
