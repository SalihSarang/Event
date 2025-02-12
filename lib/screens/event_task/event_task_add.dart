import 'package:event_vault/database/functions/add_event_task/add_event_task.dart';
import 'package:event_vault/database/modals/event_task_model/event_task_model.dart';
import 'package:event_vault/database/modals/task_model/task_model.dart';
import 'package:event_vault/utils/validation/task_validation/task_validation.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:event_vault/widgets/buttons/save_add_btn/save_add_btn.dart';
import 'package:event_vault/widgets/date_and_time/date_select/date_theme.dart';
import 'package:event_vault/widgets/event_task/event_task.dart';
import 'package:event_vault/widgets/img_add_field/img_add_field.dart';
import 'package:event_vault/widgets/text_field/text_field.dart';
import 'package:event_vault/widgets/unique_id/unique_id.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;
import 'package:image_picker/image_picker.dart';

class EventTaskAdd extends StatefulWidget {
  const EventTaskAdd({super.key, required this.eventID});
  final String eventID;
  @override
  State<EventTaskAdd> createState() => _AddTaskState();
}

class _AddTaskState extends State<EventTaskAdd> {
  final _taskTitileCtrl = TextEditingController();
  final _taskDescription = TextEditingController();
  final _dueDateCtrl = TextEditingController();
  final _taskFormKey = GlobalKey<FormState>();

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

  _validateForm() {
    if (_taskFormKey.currentState!.validate()) {
      final task = Task(
          taskID: generateID(),
          taskTitle: _taskTitileCtrl.text,
          taskDescription: _taskDescription.text,
          dueDate: _dueDateCtrl.text,
          image: imgPath);
      final eventTask = EventTaskModel(
          eventTaskID: generateID(), task: task, eventID: widget.eventID);
      addEventTask(eventTask);
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Task'),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            saveCancelColumn(
                saveBtnColor: AppTheme.hilite,
                downBtn: 'Cancel',
                upBtn: 'Save',
                onDownBtn: () {},
                onUpBtn: () => _validateForm()),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            Form(
              key: _taskFormKey,
              child: Column(
                children: [
                  myField(
                      hint: 'Enter Task Titile',
                      fieldTitle: 'Task Titile',
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
