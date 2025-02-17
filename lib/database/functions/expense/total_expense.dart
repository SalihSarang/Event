// import 'dart:developer' as developer;

// import 'package:event_vault/database/modals/expense_model/total_expense_model.dart';
// import 'package:flutter/material.dart';
// import 'package:hive/hive.dart';

// const String TOTAL_EXPENSE = 'total expense';

// final totalExpenseBox = Hive.box<TotalExpenseModel>(TOTAL_EXPENSE);
// ValueNotifier<List<TotalExpenseModel>> totalExpenseListener = ValueNotifier([]);

// addTotalExpense(TotalExpenseModel value) {
//   developer.log(' This is add fn : ${value.totalExpenseId}');

//   totalExpenseBox.put(value.totalExpenseId, value);
// }

// getAllTotalExpense() {
//   totalExpenseListener.value.clear();
//   totalExpenseListener.value = totalExpenseBox.values.toList();
//   totalExpenseListener.notifyListeners();
// }

// TotalExpenseModel? getTotalExpenseByEventId(String eventId) {
//   final eventFind = totalExpenseBox.values.firstWhere(
//     (expense) => expense.eventId == eventId,
//   );
//   final finded = eventFind != null ? eventFind : null;

//   return finded;
// }

// updateTotalExpense(TotalExpenseModel value) {
//   developer.log(' This is update fn : ${value.totalExpenseId}');
//   totalExpenseBox.put(value.totalExpenseId, value);
// }
