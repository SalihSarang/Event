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
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  final taskTitileCtrl = TextEditingController();
  final taskDescription = TextEditingController();
  final dueDateCtrl = TextEditingController();
  final taskFormKey = GlobalKey<FormState>();

  String imgPath = '';
  final imgPicker = ImagePicker();
  getImage() async {
    final pickedImage = await imgPicker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        imgPath = pickedImage.path;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Task'),
      floatingActionButton: customFloatingBtn(
          context: context,
          taskFormKey: taskFormKey,
          taskTitle: taskTitileCtrl.text,
          dueDate: dueDateCtrl.text,
          taskDescription: taskDescription.text,
          image: imgPath),
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
                      controller: taskTitileCtrl,
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
                    controller: dueDateCtrl,
                    onTap: () async {
                      dueDateCtrl.text = await selectDate(context);
                      developer.log(dueDateCtrl.text);
                    },
                  ),
                  imgAddField(
                    imagePicked: imgPath,
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
