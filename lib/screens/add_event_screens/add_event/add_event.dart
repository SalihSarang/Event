import 'package:event_vault/utils/validation/event_adding/client_info/name_validation/name_validation.dart';
import 'package:event_vault/utils/validation/event_adding/client_info/number_validation/number_validation.dart';
import 'package:event_vault/utils/validation/event_adding/event_budget/event_budget.dart';
import 'package:event_vault/utils/validation/event_adding/event_date/event_date.dart';
import 'package:event_vault/utils/validation/event_adding/event_discription/event_discription.dart';
import 'package:event_vault/utils/validation/event_adding/event_image/event_image.dart';
import 'package:event_vault/utils/validation/event_adding/event_location/event_location.dart';
import 'package:event_vault/utils/validation/event_adding/event_name/event_name.dart';
import 'package:event_vault/utils/validation/event_adding/event_time/event_time.dart';
import 'package:event_vault/screens/add_event_screens/add_catogory_menu/add_catogory_menu.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/color%20palette/color_palette.dart';
import 'package:event_vault/widgets/date_select/date_theme.dart';
import 'package:event_vault/widgets/img_add_field/img_add_field.dart';
import 'package:event_vault/widgets/save_add_btn/save_add_btn.dart';
import 'package:event_vault/widgets/text_field/text_field.dart';
import 'package:event_vault/widgets/time_selecting/theme.dart';
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
  String newImage = '';
  final picker = ImagePicker();

  //get an image from the gallery
  Future<void> getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        image = pickedFile;
        newImage = pickedFile.path; // Store the image path
      });
    }
  }

  Future<void> selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(data: dateTheme(), child: child!);
      },
    );
    if (pickedDate != null) {
      setState(() {
        date.text = DateFormat('yyyy-MMM-dd').format(pickedDate);
      });
    }
  }

  TimeOfDay _selectedTime = TimeOfDay(hour: 12, minute: 0);
  String timeString = '';
  Future<void> _selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (context, child) {
        return Theme(
          data: timeTheme(),
          child: MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
            child: child!,
          ),
        );
      },
    );

    if (picked != null && picked != _selectedTime) {
      setState(() {
        _selectedTime = picked;
        timeString =
            '${_selectedTime.hourOfPeriod.toString().padLeft(2, '0')}:${_selectedTime.minute.toString().padLeft(2, '0')} ${_selectedTime.period == DayPeriod.am ? 'AM' : 'PM'}';
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
      if (image == null) {
        eventImageValidation(image, context);
        return;
      }

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
            'Image': newImage,
            'ClietName': clietName.text,
            'ContactInfo': contactInfo.text,
            'CategoryID': widget.selectedCatogory,
            'CategoryName': widget.categoryName
          },
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    print(widget.selectedCatogory);
    print(widget.categoryName);
    timectrl.text = timeString;
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
                    key: forkey,
                    child: Column(
                      children: [
                        myField(
                          validationMode: AutovalidateMode.onUserInteraction,
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
                            _selectTime(context);
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
                          validationMode: AutovalidateMode.onUserInteraction,
                        ),
                        myBigField(
                          validateMode: AutovalidateMode.onUserInteraction,
                          hint: 'Enter Description',
                          fieldTitle: 'Description',
                          controller: descriptionCtrl,
                          validator: (value) => discription(value),
                        ),
                        myField(
                          keyboardType: TextInputType.number,
                          validationMode: AutovalidateMode.onUserInteraction,
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
                          validationMode: AutovalidateMode.onUserInteraction,
                          controller: clietName,
                          hint: 'Enter Client Name',
                          fieldTitle: 'Client Name',
                          validator: (value) => clientName(value),
                        ),
                        myField(
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          validationMode: AutovalidateMode.onUserInteraction,
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
