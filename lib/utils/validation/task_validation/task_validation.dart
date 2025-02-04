import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

taskTitleValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an event name';
  }

  RegExp regExp = RegExp(r'^[a-zA-Z0-9\s\-_]+$');
  if (!regExp.hasMatch(value)) {
    return 'Event name can only contain letters, numbers, spaces, hyphens, apostrophes, and ampersands';
  }

  if (value.length < 3) {
    return 'Event name must be at least 3 characters long';
  }

  if (value.length > 100) {
    return 'Event name must be no longer than 100 characters';
  }

  return null;
}

taskDiscription(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter a category description';
  }

  if (value.length < 10) {
    return 'Category description must be at least 10 characters long';
  }

  RegExp regExp = RegExp(r'^[a-zA-Z0-9\s,.-]+$');
  if (!regExp.hasMatch(value)) {
    return 'Category description can only contain letters, numbers, spaces, commas, periods, and hyphens';
  }

  return null;
}

taskDateValidation(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter an event date';
  }

  return null;
}

taskImageValidation(XFile? image, BuildContext ctx) {
  if (image == null) {
    ScaffoldMessenger.of(ctx).showSnackBar(
      SnackBar(
        content: Text('Please add image'),
        backgroundColor: Colors.red,
        behavior: SnackBarBehavior.floating,
        duration: Duration(seconds: 3),
        elevation: 10,
        dismissDirection: DismissDirection.horizontal,
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(ctx).size.height / 35,
          left: 20,
          right: 20,
        ),
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
          side: BorderSide(
            width: 2,
          ),
        ),
      ),
    );
  }
  return null;
}
