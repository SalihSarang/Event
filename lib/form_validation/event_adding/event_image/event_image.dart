import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

eventImageValidation(XFile? image, BuildContext ctx) {
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
