import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/img_add_field/img_add_field.dart';
import 'package:event_vault/costum_widgets/save_add_btn/save_add_btn.dart';
import 'package:event_vault/costum_widgets/text_field/text_field.dart';
import 'package:event_vault/screens/add_event_screens/add_catogory_menu/add_catogory_menu.dart';
import 'package:flutter/material.dart';
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
  final _descriptionCtrl = TextEditingController();

  void validateForm() {
    if (_forkey.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AddCategoryMenu(),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.mainBg,
      appBar: CustomAppBar(title: "Add Event"),
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
                          hint: 'Enter Description',
                          fieldTitle: 'Description',
                          controller: _descriptionCtrl),
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
                  context: context,
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
