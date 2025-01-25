import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget myField(
    {required String hint,
    required String fieldTitle,
    required String? Function(String?) validator,
    required TextEditingController controller}) {
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

Widget myBigField({required String hint, required String fieldTitle}) {
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
