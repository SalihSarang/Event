import 'package:event_vault/utils/font/app_font.dart';
import 'package:flutter/material.dart';

Widget emptyList({required messege}) {
  return Center(
    child: Text(
      messege,
      style: myFont(),
    ),
  );
}
