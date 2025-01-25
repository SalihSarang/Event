import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

const ITEMS = 'items';

ValueNotifier<List<ItemModel>> itemListener = ValueNotifier([]);

void addItems(ItemModel value) async {
  var itemBox = Hive.box<ItemModel>(ITEMS);
  await itemBox.put(value.itemId, value);
  getItems();
}

void getItems() {
  itemListener.value.clear();
  var itemBox = Hive.box<ItemModel>(ITEMS);
  itemListener.value.addAll(itemBox.values);
  itemListener.notifyListeners();
}
