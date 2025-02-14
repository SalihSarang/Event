import 'package:event_vault/database/functions/expense/expense.dart';
import 'package:event_vault/database/modals/expense_model/expense_model.dart';
import 'package:event_vault/screens/event_expense_tracker/add_expense.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_bar/app_bar.dart';
import 'package:event_vault/widgets/empty_list_handling/empty_list_handling.dart';
import 'package:event_vault/widgets/expense_screen/expense_screen.dart';
import 'package:event_vault/widgets/screen_task/screen_task.dart';
import 'package:flutter/material.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key, required this.eventID});

  final String eventID;

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  List<ExpenseModel> expenseList = [];
  double? expense;

  @override
  void initState() {
    super.initState();
    expenseListener.addListener(getExpense);
    getExpense();
  }

  getExpense() {
    expenseList = getTaskByEvetID(widget.eventID);
    setState(() {
      expense = getTotalExpenses(widget.eventID);
    });
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
                  eventID: widget.eventID,
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
