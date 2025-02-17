import 'dart:developer' as developer;

import 'package:event_vault/database/functions/expense/expense.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/database/modals/expense_model/expense_model.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:event_vault/screens/event_expense_tracker/add_expense.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:event_vault/widgets/empty_list_handling/empty_list_handling.dart';
import 'package:event_vault/widgets/expense_screen/expense_screen.dart';
import 'package:event_vault/widgets/screen_task/screen_task.dart';
import 'package:flutter/material.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker(
      {super.key, required this.event, required this.eventItems});

  final EventAddModal event;
  final List<ItemModel> eventItems;
  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  List<ExpenseModel> expenseList = [];
  double? expense = 0.0;
  double? categoryEx = 0.0;
  @override
  void initState() {
    super.initState();
    expenseListener.addListener(getExpense);
    getExpense();
    categoryExpense();
  }

  getExpense() {
    if (mounted) {
      setState(() {
        expenseList = getTaskByEvetID(widget.event.eventId);
        expense = getTotalExpenses(widget.event.eventId);
        expense = expense! + categoryEx!;
      });
    }
  }

  categoryExpense() {
    categoryEx =
        widget.eventItems.map((price) => double.parse(price.itemPrice)).reduce(
              (a, b) => a + b,
            );
    expense = expense! + categoryEx!;
    developer.log('this is expense ${categoryEx.toString()}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: 'Expense Tracker'),
      floatingActionButton: customFloatingButton(
        context: context,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AddExpense(
                  eventID: widget.event.eventId,
                ),
              ));
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Total Expense',
                    style: myFontColor(size: 30),
                  ),
                  Spacer(),
                  Text(
                    expense.toString(),
                    style: myFontColor(size: 25),
                  )
                ],
              ),
              Card(
                  color: AppTheme.secondary,
                  child: ListTile(
                    title: Text(
                      'Categiry Expense',
                      style: myFontColor(size: 20),
                    ),
                    trailing: Text(
                      categoryEx.toString(),
                      style: myFontColor(size: 18),
                    ),
                  )),
              Expanded(
                child: ValueListenableBuilder(
                  valueListenable: expenseListener,
                  builder: (context, expense, child) {
                    if (expenseList.isEmpty) {
                      return emptyList(message: 'No Expense');
                    } else {
                      return ExpenseCard(
                        expenseList: expenseList,
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
