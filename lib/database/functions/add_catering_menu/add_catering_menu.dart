import 'package:event_vault/database/modals/catogorys_model/catering_model/catering_add_menu/catering_add_menu.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const CATARING_MENU = 'catering menu';

ValueNotifier<List<CateringAddMenu>> newItemCatering = ValueNotifier([]);

void addCateringMenu(CateringAddMenu value) {
  var cateringItemBox = Hive.box<CateringAddMenu>(CATARING_MENU);
  cateringItemBox.put(value.getEventId, value);
}
