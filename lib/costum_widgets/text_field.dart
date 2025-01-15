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
            color: Colors.white,
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
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(32, 34, 54, 1),
          hintText: hint,
          hintStyle: const TextStyle(color: Color.fromRGBO(152, 152, 159, 1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 81, 81, 81),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 81, 81, 81),
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Colors.red,
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
            color: Colors.white,
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
        style: TextStyle(color: Colors.white),
        decoration: InputDecoration(
          filled: true,
          fillColor: const Color.fromRGBO(32, 34, 54, 1),
          hintText: hint,
          hintStyle: const TextStyle(color: Color.fromRGBO(152, 152, 159, 1)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
              color: Color.fromARGB(255, 81, 81, 81),
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 81, 81, 81),
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
