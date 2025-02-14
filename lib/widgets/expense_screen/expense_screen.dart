// Event Items
import 'package:event_vault/database/functions/expense/expense.dart';
import 'package:event_vault/database/modals/expense_model/expense_model.dart';
import 'package:event_vault/screens/event_expense_tracker/edit_expense.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/alert_box/alert_box.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';

class ExpenseCard extends StatelessWidget {
  ExpenseCard({super.key, required this.expenseList});

  List<ExpenseModel> expenseList;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Items',
          style: myFont(size: 25),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: expenseList.length,
            itemBuilder: (context, index) {
              final item = expenseList[index];
              return SizedBox(
                height: 100,
                child: Card(
                  color: AppTheme.secondary,
                  child: Center(
                    child: ListTile(
                      title: Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Text(
                          item.expenseName,
                          style: myFont(size: 22),
                        ),
                      ),
                      subtitle: Text(
                        'Price : ${item.amount}',
                        style: myFont(size: 17),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                              onPressed: () {
                                customAlertBox(
                                  context,
                                  message: 'Do You Want To Delete This Expense',
                                  icon: Icons.delete,
                                  noPressed: () => Navigator.pop(context),
                                  yesPressed: () {
                                    deleteExpense(item.expenseID);
                                    Navigator.pop(context);
                                  },
                                );
                              },
                              icon: Icon(
                                Icons.delete,
                                color: AppTheme.delete,
                                size: 30,
                              )),
                          IconButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          EditExpense(expense: item),
                                    ));
                              },
                              icon: Icon(
                                Icons.edit,
                                color: AppTheme.hilite,
                                size: 30,
                              ))
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
// Event Items
