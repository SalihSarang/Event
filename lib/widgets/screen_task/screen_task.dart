import 'package:event_vault/screens/task_screen/add_task.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/utils/validation/task_validation/task_validation.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:event_vault/widgets/buttons/save_add_btn/save_add_btn.dart';
import 'package:event_vault/widgets/date_and_time/date_select/date_theme.dart';
import 'package:event_vault/widgets/img_add_field/img_add_field.dart';
import 'package:event_vault/widgets/text_field/text_field.dart';
import 'package:flutter/material.dart';
import 'dart:developer' as developer;

Widget customFloatingButton(BuildContext context) {
  return SizedBox(
    height: 65,
    width: 65,
    child: FloatingActionButton(
      elevation: 10,
      splashColor: AppTheme.secondary,
      backgroundColor: AppTheme.hilite,
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AddTask(),
        ));
      },
      child: Icon(
        Icons.add,
        size: 35,
      ),
    ),
  );
}

Widget taskCard(
    {required String taskTitle,
    required String dueDate,
    required String image}) {
  return Material(
    color: Colors.transparent,
    child: InkWell(
      borderRadius: BorderRadius.circular(15),
      splashColor: Colors.white,
      onTap: () {},
      child: Card(
        elevation: 20,
        color: AppTheme.secondary,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 10, top: 15, bottom: 15, right: 15),
              child: Container(
                height: 85,
                width: 85,
                decoration: BoxDecoration(
                    color: AppTheme.hint,
                    borderRadius: BorderRadius.circular(50)),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskTitle,
                  style: myFont(size: 20),
                ),
                Text(
                  dueDate,
                  style: hintFont(),
                )
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: PopupMenuButton(
                iconSize: 30,
                iconColor: AppTheme.textW,
                color: AppTheme.secondary,
                itemBuilder: (context) => [
                  PopupMenuItem(
                      child: Row(
                    children: [
                      Wrap(
                        spacing: 20,
                        children: [
                          Icon(
                            Icons.edit,
                            color: AppTheme.hilite,
                            size: 30,
                          ),
                          Text(
                            'Edit',
                            style: myFont(size: 20),
                          )
                        ],
                      ),
                    ],
                  )),
                  PopupMenuItem(
                      child: Row(
                    children: [
                      Wrap(spacing: 20, children: [
                        Icon(
                          Icons.delete,
                          color: AppTheme.delete,
                          size: 30,
                        ),
                        Text(
                          'Delete',
                          style: myFont(size: 20),
                        )
                      ]),
                    ],
                  ))
                ],
              ),
            )
          ],
        ),
      ),
    ),
  );
}

Widget customFloatingBtn() {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        saveCancelColumn(
          upBtn: 'Cancel',
          downBtn: 'Save',
          onDownBtn: () {},
          onUpBtn: () {},
        ),
      ],
    ),
  );
}

customTaskForm(
    {required TextEditingController taskTitile,
    required TextEditingController taskDescription,
    required TextEditingController dueDate,
    required BuildContext context,
    required Key taskFormKey}) {
  return Form(
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
          buttonTitle: 'Add Image',
          myIcon: Icon(Icons.add_a_photo),
          onPressed: () {},
        ),
      ],
    ),
  );
}
