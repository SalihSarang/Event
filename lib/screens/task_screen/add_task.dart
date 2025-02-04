import 'package:event_vault/utils/validation/task_validation/task_validation.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/date_and_time/date_select/date_theme.dart';
import 'package:event_vault/widgets/img_add_field/img_add_field.dart';
import 'package:event_vault/widgets/screen_task/screen_task.dart';
import 'package:event_vault/widgets/text_field/text_field.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

import 'package:image_picker/image_picker.dart';

class AddTask extends StatefulWidget {
  AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final taskTitile = TextEditingController();
  final taskDescription = TextEditingController();
  final dueDate = TextEditingController();
  final taskFormKey = GlobalKey<FormState>();
  XFile? image;
  String imgPath = '';
  final imgPicker = ImagePicker();
  getImage() async {
    final pickedImage = await imgPicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        image = pickedImage;
        imgPath = pickedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Task'),
      floatingActionButton: customFloatingBtn(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: taskFormKey,
              child: Column(
                children: [
                  myField(
                      hint: 'Enter Task Titile',
                      fieldTitle: 'Task Titile',
                      validator: (value) => taskTitleValidation(value),
                      controller: taskTitile,
                      validationMode: AutovalidateMode.onUserInteraction),
                  myBigField(
                      hint: 'Enter Task Description',
                      fieldTitle: 'Task Description',
                      controller: taskDescription,
                      validator: (value) => taskDiscription(value),
                      validateMode: AutovalidateMode.onUserInteraction),
                  dateField(
                    hint: 'Select Due Date',
                    fieldTitle: 'Due Date',
                    validator: (value) => taskDateValidation(value),
                    controller: dueDate,
                    onTap: () async {
                      dueDate.text = await selectDate(context);
                      developer.log(dueDate.text);
                    },
                  ),
                  imgAddField(
                    imagePicked: image,
                    buttonTitle: 'Add Image',
                    myIcon: Icon(Icons.add_a_photo),
                    onPressed: () {
                      getImage();
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
