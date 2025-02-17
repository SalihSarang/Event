import 'package:event_vault/database/modals/expense_model/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const String EXPENSE_BOX = 'addExpense';
final expenseBox = Hive.box<ExpenseModel>(EXPENSE_BOX);
ValueNotifier<List<ExpenseModel>> expenseListener = ValueNotifier([]);

addExpense(ExpenseModel value) async {
  expenseBox.put(value.expenseID, value);
  getAllExpense();
}

getAllExpense() {
  expenseListener.value.clear();
  expenseListener.value = expenseBox.values.toList();
  expenseListener.notifyListeners();
}

deleteExpense(String expenseID) {
  expenseBox.delete(expenseID);
  getAllExpense();
}

List<ExpenseModel> getExpenseByEvetID(String eventID) {
  final expense = expenseBox.values
      .where(
        (expense) => expense.eventID == eventID,
      )
      .toList();
  return expense;
}

updateExpense(ExpenseModel value) {
  expenseBox.put(value.expenseID, value);
  getAllExpense();
}

List<ExpenseModel> getExpenseByEventID(String eventID) {
  return expenseBox.values
      .where((expense) => expense.eventID == eventID)
      .toList();
}

double getTotalExpenses(String eventID) {
  double total = 0.0;
  var expenses = getExpenseByEventID(eventID);

  for (var expense in expenses) {
    total += double.tryParse(expense.amount) ?? 0.0;
  }

  return total;
}

ExpenseModel getExpenseForTheEvent(String eventID) {
  return expenseBox.values.where((expense) => expense.eventID == eventID).first;
}
