import 'dart:math';

import 'package:event_vault/costum_widgets/catogory_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenEventManager extends StatefulWidget {
  const ScreenEventManager({super.key});

  @override
  State<ScreenEventManager> createState() => _ScreenEventManagerState();
}

class _ScreenEventManagerState extends State<ScreenEventManager> {
  List<String> dropDownList = ['All', 'Catering', 'Decoration'];
  var selectedTextFieldItem = 'All';

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Center(
            child: Text(
              "Event Manager",
              style: TextStyle(color: Colors.white, fontSize: 30),
            ),
          ),
        ),
        backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search events by name, date or location',
                hintStyle: TextStyle(color: Color.fromRGBO(124, 125, 144, 1)),
                prefixIcon: Icon(
                  Icons.search,
                  color: Color.fromRGBO(124, 125, 144, 1),
                  size: 30,
                ),
                border: OutlineInputBorder(),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(
                      color: Color.fromRGBO(32, 34, 54, 1), width: 2.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide(color: Colors.transparent),
                ),
                fillColor: Color.fromRGBO(32, 34, 54, 1),
                filled: true,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                'Filters',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            dropDown(
              dropDownList: dropDownList,
              selectedTextFieldItem: selectedTextFieldItem,
              onChanged: (String? newValue) {
                setState(() {
                  selectedTextFieldItem = newValue!;
                });
              },
            )
          ],
        ),
      ),
    );
  }
}
