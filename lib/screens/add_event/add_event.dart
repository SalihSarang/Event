import 'package:event_vault/costum_widgets/img_add_field.dart';
import 'package:event_vault/costum_widgets/save_add_btn.dart';
import 'package:event_vault/costum_widgets/text_field.dart';
import 'package:event_vault/screens/add_catering_menu/add_catering_menu.dart';
import 'package:event_vault/screens/add_decoration/add_decoration.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';

class ScreenAddEvent extends StatefulWidget {
  ScreenAddEvent({super.key, required this.selectedCatogory});

  String selectedCatogory;

  @override
  State<ScreenAddEvent> createState() => _ScreenAddEventState();
}

class _ScreenAddEventState extends State<ScreenAddEvent> {
  XFile? image;
  final picker = ImagePicker();
  getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(
      () {
        if (pickedFile != null) {
          image = pickedFile;
        }
      },
    );
  }

  final _forkey = GlobalKey<FormState>();
  final _timectrl = TextEditingController();
  final _eventName = TextEditingController();
  final _date = TextEditingController();
  final _location = TextEditingController();
  final _budget = TextEditingController();
  final _clietName = TextEditingController();
  final _contactInfo = TextEditingController();

  void validateForm() {
    if (_forkey.currentState!.validate()) {
      switch (widget.selectedCatogory) {
        case "Catering":
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddCateringMenu(),
          ));
          break;
        case "Decoration":
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddDecorationMenu(),
          ));
          break;
      }
    }
  }

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
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _forkey,
                  child: Column(
                    children: [
                      myField(
                        controller: _eventName,
                        hint: 'Enter Event Name',
                        fieldTitle: 'Event Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                      myField(
                        controller: _date,
                        hint: 'Enter Enter Date',
                        fieldTitle: 'Date',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                      myField(
                        controller: _timectrl,
                        hint: 'Enter Time',
                        fieldTitle: 'Time',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                      myField(
                        controller: _location,
                        hint: 'Enter Location',
                        fieldTitle: 'Location',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                      myBigField(
                          hint: 'Enter Description', fieldTitle: 'Description'),
                      myField(
                        controller: _budget,
                        hint: 'Enter Budget',
                        fieldTitle: 'Budget',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      imgAddField(
                        imagePicked: image,
                        buttonTitle: 'Add Photo',
                        myIcon: Icon(Icons.camera_alt_outlined),
                        onPressed: getImageFromGallery,
                      ),
                      myField(
                        controller: _clietName,
                        hint: 'Enter Cliet Name',
                        fieldTitle: 'Cliet Name',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                      myField(
                        controller: _contactInfo,
                        hint: 'Enter Contact Info',
                        fieldTitle: 'Contact Information',
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'This field is required';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
                saveCancelRow(
                  rightBtn: 'Next',
                  leftBtn: 'Cancel',
                  onRightBtn: () {
                    validateForm();
                  },
                  onleftBtn: () {
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
