import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

Widget settingsOptions(
    {required Icon leadIcon,
    required String title,
    String? subTitle,
    required GestureTapCallback onTap}) {
  return GestureDetector(
    onTap: onTap,
    child: Card(
      color: AppTheme.secondary,
      child: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: AppTheme.secondary,
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: leadIcon,
              ),
              SizedBox(
                width: 25,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text(title, style: myFontColor(size: 20))],
                ),
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget buildFeatureItem(String feature) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      children: [
        Icon(Icons.check, color: Colors.green),
        SizedBox(width: 8),
        Text(feature, style: myFontColor(size: 18)),
      ],
    ),
  );
}
