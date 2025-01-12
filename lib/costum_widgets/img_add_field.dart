import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget imgAddField(
    {required String buttonTitle,
    required Icon myIcon,
    required Function(String?) onPressed}) {
  return Column(
    children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Color.fromARGB(255, 81, 81, 81),
                width: 1,
              ),
            ),
            backgroundColor: const Color.fromRGBO(32, 34, 54, 1),
            minimumSize: Size(double.infinity, 60),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.camera_alt_outlined,
                color: Colors.white,
                size: 30,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                buttonTitle,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              )
            ],
          )),
      SizedBox(
        height: 10,
      ),
      Container(
        height: 200,
        decoration: BoxDecoration(
            color: Color.fromRGBO(32, 34, 54, 1),
            borderRadius: BorderRadius.all(Radius.circular(10)),
            border: Border.all(
              width: 1,
              color: Color.fromARGB(255, 81, 81, 81),
            )),
      ),
      SizedBox(
        height: 10,
      ),
    ],
  );
}
