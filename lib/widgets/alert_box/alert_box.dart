import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

void customAlertBox(
  BuildContext context, {
  required String title,
  required String message,
  required IconData icon,
  required VoidCallback noPressed,
  required VoidCallback yesPressed,
  Color? color,
}) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        backgroundColor: AppTheme.secondary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    color: color ?? AppTheme.delete,
                    size: 50,
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      message,
                      textAlign: TextAlign.start,
                      style: myFont(size: 18),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: noPressed,
                    child: Text('No', style: myFont(size: 18)),
                  ),
                  SizedBox(width: 10),
                  TextButton(
                    onPressed: yesPressed,
                    child: Text('Yes', style: myFont(size: 18)),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
