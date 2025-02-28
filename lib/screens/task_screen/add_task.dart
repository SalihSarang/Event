import 'dart:io';

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
  final _taskTitileCtrl = TextEditingController();
  final _taskDescription = TextEditingController();
  final _dueDateCtrl = TextEditingController();
  final _taskFormKey = GlobalKey<FormState>();

  String? imgPath;
  final imgPicker = ImagePicker();

  Future<void> getImage() async {
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
          taskFormKey: _taskFormKey,
          taskTitle: _taskTitileCtrl.text,
          dueDate: _dueDateCtrl.text,
          taskDescription: _taskDescription.text,
          image: imgPath ?? ''),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: _taskFormKey,
              child: Column(
                children: [
                  myField(
                      hint: 'Enter Task Title',
                      fieldTitle: 'Task Title',
                      validator: (value) => taskTitleValidation(value),
                      controller: _taskTitileCtrl,
                      validationMode: AutovalidateMode.onUserInteraction),
                  myBigField(
                      hint: 'Enter Task Description',
                      fieldTitle: 'Task Description',
                      controller: _taskDescription,
                      validator: (value) => taskDiscription(value),
                      validateMode: AutovalidateMode.onUserInteraction),
                  dateField(
                    hint: 'Select Due Date',
                    fieldTitle: 'Due Date',
                    validator: (value) => taskDateValidation(value),
                    controller: _dueDateCtrl,
                    onTap: () async {
                      _dueDateCtrl.text = await selectDate(context);
                      developer.log(_dueDateCtrl.text);
                    },
                  ),
                  imgAddField(
                    imagePicked: imgPath,
                    buttonTitle: 'Add Image',
                    myIcon: Icon(Icons.add_a_photo),
                    onPressed: getImage,
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
