import 'package:event_vault/utils/font/app_font.dart';
import 'package:flutter/material.dart';

Widget emptyList({required String message}) {
  return Center(
    child: Text(
      message,
      style: myFont(size: 25),
    ),
  );
}
