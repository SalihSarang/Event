import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:hive/hive.dart';

const ITEMS = 'items';

void addItems(ItemModel value) {
  var addItem = Hive.box<ItemModel>(ITEMS);
  addItem.put(value.itemId, value);
}
