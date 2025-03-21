import 'dart:developer' as developer;

import 'package:event_vault/database/functions/expense/expense.dart';
import 'package:event_vault/database/modals/expense_model/expense_model.dart';
import 'package:event_vault/utils/validation/category_details/category_item/item_price/item_price.dart';
import 'package:event_vault/utils/validation/event_adding/event_name/event_name.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/buttons/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/widgets/text_field/text_field.dart';
import 'package:flutter/material.dart';

class EditExpense extends StatelessWidget {
  EditExpense({super.key, required this.expense});
  final ExpenseModel expense;

  final expenseNameCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final expenseFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    expenseNameCtrl.text = expense.expenseName;
    amountCtrl.text = expense.amount;

    developer.log(expense.expenseID);
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
              btnText: 'Save Expense',
              onPressed: () {
                if (expenseFormKey.currentState!.validate()) {
                  developer.log(
                      'Total expense Update screen : ${expense.totalExpense}');
                  final upexpense = ExpenseModel(
                      totalExpense: expense.totalExpense,
                      expenseName: expenseNameCtrl.text,
                      amount: amountCtrl.text,
                      expenseID: expense.expenseID,
                      eventID: expense.eventID);
                  updateExpense(upexpense);
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
