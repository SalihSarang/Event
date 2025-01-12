import 'package:event_vault/costum_widgets/catogory_dropdown.dart';
import 'package:event_vault/costum_widgets/img_add_field.dart';
import 'package:event_vault/costum_widgets/save_add_btn.dart';
import 'package:event_vault/costum_widgets/text_field.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ScreenAddEvent extends StatefulWidget {
  const ScreenAddEvent({super.key});

  @override
  State<ScreenAddEvent> createState() => _ScreenAddEventState();
}

class _ScreenAddEventState extends State<ScreenAddEvent> {
  List<String> addEventList = ['Select One', 'Party', 'Catering', 'Decoration'];
  String starting = 'Select One';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(25, 26, 37, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(25, 26, 37, 1),
        title: Center(
          child: Text(
            "Add Event",
            style: GoogleFonts.roboto(
              color: Colors.white,
              fontWeight: FontWeight.w900,
              fontSize: 30,
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Select Catogory',
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
                dropDown(
                  dropDownList: addEventList,
                  selectedTextFieldItem: starting,
                  onChanged: (String? value) {
                    setState(() {
                      starting = value!;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                myField(hint: 'Enter Event Name', fieldTitle: 'Event Name'),
                myField(hint: 'Enter Enter Date', fieldTitle: 'Date'),
                myField(hint: 'Enter Time', fieldTitle: 'Time'),
                myField(hint: 'Enter Location', fieldTitle: 'Location'),
                myBigField(
                    hint: 'Enter Description', fieldTitle: 'Description'),
                myField(hint: 'Enter Budget', fieldTitle: 'Budget'),
                SizedBox(
                  height: 10,
                ),
                imgAddField(
                  buttonTitle: 'Add Photo',
                  myIcon: Icon(Icons.camera_alt_outlined),
                  onPressed: (value) {},
                ),
                myField(hint: 'Enter Cliet Name', fieldTitle: 'Cliet Name'),
                myField(
                    hint: 'Enter Contact Info',
                    fieldTitle: 'Contact Information'),
                saveCancel(
                  rightBtn: 'Next',
                  leftBtn: 'Cancel',
                  onRightBtn: () {},
                  onleftBtn: () {},
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
