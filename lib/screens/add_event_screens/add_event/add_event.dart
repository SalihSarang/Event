import 'package:event_vault/costum_widgets/app_bar/app_bar.dart';
import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/costum_widgets/img_add_field/img_add_field.dart';
import 'package:event_vault/costum_widgets/save_add_btn/save_add_btn.dart';
import 'package:event_vault/costum_widgets/text_field/text_field.dart';
import 'package:event_vault/form_validation/event_adding/client_info/name_validation/name_validation.dart';
import 'package:event_vault/form_validation/event_adding/client_info/number_validation/number_validation.dart';
import 'package:event_vault/form_validation/event_adding/event_budget/event_budget.dart';
import 'package:event_vault/form_validation/event_adding/event_date/event_date.dart';
import 'package:event_vault/form_validation/event_adding/event_discription/event_discription.dart';
import 'package:event_vault/form_validation/event_adding/event_image/event_image.dart';
import 'package:event_vault/form_validation/event_adding/event_location/event_location.dart';
import 'package:event_vault/form_validation/event_adding/event_name/event_name.dart';
import 'package:event_vault/form_validation/event_adding/event_time/event_time.dart';
import 'package:event_vault/screens/add_event_screens/add_catogory_menu/add_catogory_menu.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

class ScreenAddEvent extends StatefulWidget {
  ScreenAddEvent(
      {super.key, required this.selectedCatogory, required this.categoryName});

  String selectedCatogory;
  String categoryName;

  @override
  State<ScreenAddEvent> createState() => _ScreenAddEventState();
}

class _ScreenAddEventState extends State<ScreenAddEvent> {
  XFile? image;
  final picker = ImagePicker();

  //get an image from the gallery
  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        image = pickedFile;
      }
    });
  }

  //select a date
  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );
    if (pickedDate != null) {
      setState(() {
        date.text = DateFormat('yyyy-MMM-dd').format(pickedDate);
      });
    }
  }

  // Form key and controllers
  final forkey = GlobalKey<FormState>();
  final timectrl = TextEditingController();
  final eventName = TextEditingController();
  final date = TextEditingController();
  final location = TextEditingController();
  final budget = TextEditingController();
  final clietName = TextEditingController();
  final contactInfo = TextEditingController();
  final descriptionCtrl = TextEditingController();

  //validate and navigate to the next screen
  void validateForm() {
    if (forkey.currentState!.validate()) {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => AddCategoryMenu(
          categotyId: widget.selectedCatogory,
          eventDetals: {
            'EventName': eventName.text,
            'Date': date.text,
            'Time': timectrl.text,
            'Location': location.text,
            'DescriptionCtrl': descriptionCtrl.text,
            'Budget': budget.text,
            'Image': image,
            'ClietName': clietName.text,
            'ContactInfo': contactInfo.text,
            'CategoryID': widget.selectedCatogory,
          },
        ),
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
                  const SizedBox(height: 10),
                  Form(
                    autovalidateMode: AutovalidateMode.always,
                    key: forkey,
                    child: Column(
                      children: [
                        myField(
                          controller: eventName,
                          hint: 'Enter Event Name',
                          fieldTitle: 'Event Name',
                          validator: (value) => eventNameValidation(value),
                        ),
                        dateField(
                          onTap: () => selectDate(context),
                          controller: date,
                          hint: 'Enter Enter Date',
                          fieldTitle: 'Date',
                          validator: (value) => eventDateValidation(value),
                        ),
                        timeField(
                          onTap: () {
                            // Add time picker logic here
                          },
                          controller: timectrl,
                          hint: 'Enter Time',
                          fieldTitle: 'Time',
                          validator: (value) => eventTimeValidation(value),
                        ),
                        myField(
                          controller: location,
                          hint: 'Enter Location',
                          fieldTitle: 'Location',
                          validator: (value) => eventLocationValidation(value),
                        ),
                        myBigField(
                          hint: 'Enter Description',
                          fieldTitle: 'Description',
                          controller: descriptionCtrl,
                          validator: (value) => discription(value),
                        ),
                        myField(
                          controller: budget,
                          hint: 'Enter Budget',
                          fieldTitle: 'Budget',
                          validator: (value) => eventBudgetValidation(value),
                        ),
                        const SizedBox(height: 10),
                        imgAddField(
                          imagePicked: image,
                          buttonTitle: 'Add Photo',
                          myIcon: const Icon(Icons.camera_alt_outlined),
                          onPressed: getImageFromGallery,
                        ),
                        myField(
                          controller: clietName,
                          hint: 'Enter Client Name',
                          fieldTitle: 'Client Name',
                          validator: (value) => clientName(value),
                        ),
                        myField(
                          controller: contactInfo,
                          hint: 'Enter Contact Info',
                          fieldTitle: 'Contact Information',
                          validator: (value) => isValidPhoneNumber(value),
                        ),
                      ],
                    ),
                  ),
                  saveCancelRow(
                    context: context,
                    rightBtn: 'Next',
                    leftBtn: 'Cancel',
                    onRightBtn: () {
                      eventImageValidation(image, context);
                      validateForm();
                    },
                    onleftBtn: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
