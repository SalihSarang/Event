import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget saveCancelRow(
    {required String rightBtn,
    required String leftBtn,
    required VoidCallback onRightBtn,
    required VoidCallback onleftBtn}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Color.fromARGB(255, 81, 81, 81),
                width: 0.1,
              ),
            ),
            backgroundColor: const Color.fromRGBO(32, 34, 54, 1),
            minimumSize: Size(235, 60),
          ),
          onPressed: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                leftBtn,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              )
            ],
          )),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                width: 0,
              ),
            ),
            backgroundColor: const Color.fromRGBO(30, 92, 228, 1),
            minimumSize: Size(235, 60),
          ),
          onPressed: onRightBtn,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                rightBtn,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              )
            ],
          )),
    ],
  );
}

Widget saveCancelColumn(
    {required String rightBtn,
    required String leftBtn,
    required VoidCallback onRightBtn,
    required VoidCallback onleftBtn}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                color: Color.fromARGB(255, 81, 81, 81),
                width: 0.1,
              ),
            ),
            backgroundColor: const Color.fromRGBO(32, 34, 54, 1),
            minimumSize: Size(235, 60),
          ),
          onPressed: () {},
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                leftBtn,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              )
            ],
          )),
      ElevatedButton(
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: BorderSide(
                width: 0,
              ),
            ),
            backgroundColor: const Color.fromRGBO(30, 92, 228, 1),
            minimumSize: Size(235, 60),
          ),
          onPressed: onRightBtn,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 10,
              ),
              Text(
                rightBtn,
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.w800,
                  fontSize: 20,
                ),
              )
            ],
          )),
    ],
  );
}
