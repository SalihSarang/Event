import 'package:event_vault/database/modals/catogorys_model/catering_model/catering_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const CATARING = 'cataring';

ValueNotifier<List<CataringMenuModel>> cateringListener = ValueNotifier([]);

void addCatering(CataringMenuModel value) {
  var foodBox = Hive.box<CataringMenuModel>(CATARING);
  foodBox.put(value.getEventId, value);
}
