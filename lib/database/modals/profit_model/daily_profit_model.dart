import 'package:hive/hive.dart';
part 'daily_profit_model.g.dart';

@HiveType(typeId: 9)
class DailyProfitModel {
  @HiveField(0)
  String dailyProfitId;
  @HiveField(1)
  String dailyProfit;
  @HiveField(2)
  String date;
  DailyProfitModel(
      {required this.dailyProfitId,
      required this.dailyProfit,
      required this.date});
}
