import 'package:event_vault/screens/event_history/event_history.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

eventCompleted({required BuildContext context}) {
  return Container(
    width: double.infinity,
    height: 200,
    decoration: BoxDecoration(
        color: AppTheme.secondary, borderRadius: BorderRadius.circular(15)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '0',
          style: myFont(size: 35),
        ),
        Text(
          'Completed Event',
          style: myFont(size: 25),
        ),
        TextButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EventHistory(),
              ));
            },
            child: Text(
              'Event History',
              style: myFont(size: 20),
            ))
      ],
    ),
  );
}

Widget graph() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Profit',
        style: myFont(size: 25),
      ),
      Container(
        width: double.infinity,
        height: 300,
        decoration: BoxDecoration(
            color: AppTheme.secondary, borderRadius: BorderRadius.circular(15)),
        child: Center(
            child: Text(
          'Graph',
          style: myFont(size: 20),
        )),
      )
    ],
  );
}
