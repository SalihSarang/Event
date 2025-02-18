import 'dart:developer' as developer;

import 'package:event_vault/database/modals/profit_model/event_profit_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';

const String EVENT_PROFIT = 'eventProfit';
final eventProfitBox = Hive.box<EventProfitModel>(EVENT_PROFIT);

ValueNotifier<List<EventProfitModel>> eventProfitListener = ValueNotifier([]);

addEventProfit(EventProfitModel value) {
  developer.log('this is profit ${value.profit}');
  eventProfitBox.put(value.profitId, value);
  getAllProfits();
}

getAllProfits() {
  eventProfitListener.value.clear();
  eventProfitListener.value = eventProfitBox.values.toList();
  eventProfitListener.notifyListeners();
}

deleteProfit(String profitId) {
  developer.log('This is profit id : $profitId');
  eventProfitBox.delete(profitId);
  getAllProfits();
}

EventProfitModel getProfitByEventId(String eventId) {
  return eventProfitBox.values.firstWhere(
    (profit) => profit.eventId == eventId,
  );
}

deleteProfitByEventId(String eventId) {
  final profit = eventProfitBox.values.firstWhere(
    (profit) => profit.eventId == eventId,
  );
  eventProfitBox.delete(profit.profitId);
  getAllProfits();
}

String calculateProfit(String eventBudget, String eventExpense) {
  double eventBudgetNum = double.parse(eventBudget);
  double eventExpenseNum = double.parse(eventExpense);
  developer.log(eventBudget);
  developer.log(eventExpense);

  final profit = eventBudgetNum - eventExpenseNum;
  return profit.toString();
}
