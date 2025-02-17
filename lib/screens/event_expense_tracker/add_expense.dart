import 'dart:developer' as developer;

import 'package:event_vault/database/functions/expense/expense.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/database/modals/expense_model/expense_model.dart';
import 'package:event_vault/utils/validation/category_details/category_item/item_price/item_price.dart';
import 'package:event_vault/utils/validation/event_adding/event_name/event_name.dart';
import 'package:event_vault/widgets/alert_box/alert_box.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/buttons/add_menu_btn/add_menu_btn.dart';
import 'package:event_vault/widgets/text_field/text_field.dart';
import 'package:event_vault/widgets/unique_id/unique_id.dart';
import 'package:flutter/material.dart';

class AddExpense extends StatelessWidget {
  AddExpense({super.key, required this.event, required this.eventExpense});
  final EventAddModal event;
  final double eventExpense;

  final expenseNameCtrl = TextEditingController();
  final amountCtrl = TextEditingController();
  final expenseFormKey = GlobalKey<FormState>();
  double totalEx = 0.0;

  totalExpense() {
    developer.log('this is total expense one : ${eventExpense.toString()}');
    totalEx = eventExpense;
    totalEx += double.parse(amountCtrl.text);
    developer.log('this is total expense two : ${totalEx.toString()}');

    return totalEx;
  }

  @override
  Widget build(BuildContext context) {
    developer.log(event.eventId);
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
                    final eventBudget = double.tryParse(event.budget) ?? 0.0;
                    final expenseAmount =
                        double.tryParse(amountCtrl.text) ?? 0.0;
                    final computedTotalExpense = totalExpense();
                    developer.log('Event Expense : $eventExpense');

                    developer.log('Event Budget : $eventBudget');

                    if (eventBudget > computedTotalExpense) {
                      final expense = ExpenseModel(
                        totalExpense: totalEx.toString(),
                        expenseName: expenseNameCtrl.text,
                        amount: amountCtrl.text,
                        expenseID: generateID(),
                        eventID: event.eventId,
                      );
                      addExpense(expense);
                      Navigator.pop(context);

                      Navigator.pop(context);
                    } else {
                      customAlertBox(
                        title: 'Warning',
                        context,
                        message:
                            'Expense is greater than budget. Do you want to add this expense?',
                        noPressed: () => Navigator.pop(context),
                        yesPressed: () {
                          final expense = ExpenseModel(
                            totalExpense: totalEx.toString(),
                            expenseName: expenseNameCtrl.text,
                            amount: amountCtrl.text,
                            expenseID: generateID(),
                            eventID: event.eventId,
                          );
                          addExpense(expense);

                          Navigator.pop(context);
                        },
                      );
                    }
                  }
                })
          ],
        )),
      ),
    );
  }
}
