import 'dart:developer' as developer;

import 'package:event_vault/database/functions/add_expense/add_expense.dart';
import 'package:event_vault/database/modals/expense_model/expense_model.dart';
import 'package:event_vault/utils/validation/category_details/category_item/item_price/item_price.dart';
import 'package:event_vault/utils/validation/event_adding/event_name/event_name.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/buttons/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/widgets/text_field/text_field.dart';
import 'package:event_vault/widgets/unique_id/unique_id.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatelessWidget {
  AddExpense({super.key, required this.eventID});
  String eventID;

  final expenseNameCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final expenseFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    developer.log(eventID);
    return Scaffold(
      appBar: CustomAppBar(title: 'Add Expense'),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
            child: ListView(
          children: [
            Form(
              key: expenseFormKey,
              child: Column(
                children: [
                  myField(
                      hint: 'Enter Expense Name',
                      fieldTitle: 'Expense Name',
                      validator: (value) => eventNameValidation(value),
                      controller: expenseNameCtrl,
                      validationMode: AutovalidateMode.onUserInteraction),
                  myField(
                      keyboardType: TextInputType.number,
                      hint: 'Enter Amount',
                      fieldTitle: 'Amount',
                      validator: (value) => itemPriceValidation(value),
                      controller: amountCtrl,
                      validationMode: AutovalidateMode.onUserInteraction),
                ],
              ),
            ),
            SizedBox(height: 10),
            SizedBox(height: 10),
            addMenuBtn(
              btnText: 'Add Expense',
              onPressed: () {
                if (expenseFormKey.currentState!.validate()) {
                  final expense = ExpenseModel(
                      expenseName: expenseNameCtrl.text,
                      amount: amountCtrl.text,
                      expenseID: generateID(),
                      eventID: eventID);
                  addExpense(expense);
                  Navigator.pop(context);
                }
              },
            )
          ],
        )),
      ),
    );
  }
}
