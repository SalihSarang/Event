import 'package:event_vault/widgets/color%20palette/color_palette.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget myField({
  required String hint,
  required String fieldTitle,
  required String? Function(String?) validator,
  required TextEditingController controller,
  required AutovalidateMode validationMode,
  TextInputType? keyboardType,
  int? maxLength,
}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          fieldTitle,
          style: GoogleFonts.roboto(
            color: ColorPalette.textW,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        maxLength: maxLength,
        autovalidateMode: validationMode,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        style: TextStyle(color: ColorPalette.textW),
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorPalette.secondary,
          hintText: hint,
          hintStyle: const TextStyle(color: ColorPalette.hint),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorPalette.hint,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorPalette.hint,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorPalette.delete,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorPalette.delete,
              width: 2,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}

Widget myBigField(
    {required String hint,
    required String fieldTitle,
    required TextEditingController controller,
    required String? Function(String?) validator,
    required AutovalidateMode validateMode}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          fieldTitle,
          style: GoogleFonts.roboto(
            color: ColorPalette.textW,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        autovalidateMode: validateMode,
        validator: validator,
        controller: controller,
        maxLines: 5,
        minLines: 5,
        style: TextStyle(color: ColorPalette.textW),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(32, 34, 54, 1),
          hintText: hint,
          hintStyle: const TextStyle(color: ColorPalette.hint),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorPalette.hint,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorPalette.hint,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorPalette.delete,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorPalette.delete,
              width: 2,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}

Widget searchField(
    {required String hint, required TextEditingController controller}) {
  return Column(
    children: [
      TextFormField(
        controller: controller,
        style: TextStyle(color: ColorPalette.textW),
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.search,
            color: ColorPalette.hint,
            size: 30,
          ),
          filled: true,
          fillColor: ColorPalette.secondary,
          hintText: hint,
          hintStyle: const TextStyle(color: ColorPalette.hint),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorPalette.hint,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorPalette.hint,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorPalette.delete,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorPalette.delete,
              width: 2,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}

Widget dateField({
  required String hint,
  required String fieldTitle,
  required String? Function(String?) validator,
  required TextEditingController controller,
  required GestureTapCallback onTap,
}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          fieldTitle,
          style: GoogleFonts.roboto(
            color: ColorPalette.textW,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        readOnly: true,
        onTap: onTap,
        controller: controller,
        validator: validator,
        style: TextStyle(color: ColorPalette.textW),
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorPalette.secondary,
          hintText: hint,
          hintStyle: const TextStyle(color: ColorPalette.hint),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorPalette.hint,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorPalette.hint,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorPalette.delete,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorPalette.delete,
              width: 2,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}

Widget timeField(
    {required String hint,
    required String fieldTitle,
    required String? Function(String?) validator,
    required TextEditingController controller,
    TextInputType? keyboardType,
    required GestureCancelCallback onTap}) {
  return Column(
    children: [
      Align(
        alignment: Alignment.topLeft,
        child: Text(
          fieldTitle,
          style: GoogleFonts.roboto(
            color: ColorPalette.textW,
            fontWeight: FontWeight.w800,
            fontSize: 20,
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
      TextFormField(
        onTap: onTap,
        readOnly: true,
        keyboardType: keyboardType,
        controller: controller,
        validator: validator,
        style: TextStyle(color: ColorPalette.textW),
        decoration: InputDecoration(
          filled: true,
          fillColor: ColorPalette.secondary,
          hintText: hint,
          hintStyle: const TextStyle(color: ColorPalette.hint),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorPalette.hint,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: ColorPalette.hint,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorPalette.delete,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: ColorPalette.delete,
              width: 2,
            ),
          ),
        ),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}
