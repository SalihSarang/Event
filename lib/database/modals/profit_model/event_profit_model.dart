import 'package:hive/hive.dart';
part 'event_profit_model.g.dart';

@HiveType(typeId: 8)
class EventProfitModel {
  @HiveField(0)
  String profitId;
  @HiveField(1)
  String profit;
  @HiveField(2)
  String eventId;
  EventProfitModel(
      {required this.profitId, required this.profit, required this.eventId});
}
