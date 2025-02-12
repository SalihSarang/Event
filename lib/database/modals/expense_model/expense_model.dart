import 'package:hive/hive.dart';
part 'expense_model.g.dart';

@HiveType(typeId: 7)
class ExpenseModel {
  @HiveField(0)
  String expenseName;
  @HiveField(1)
  String amount;
  @HiveField(2)
  String expenseID;
  @HiveField(3)
  String eventID;
  ExpenseModel(
      {required this.expenseName,
      required this.amount,
      required this.expenseID,
      required this.eventID});
}
