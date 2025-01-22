import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:hive/hive.dart';

const ITEMS = 'items';

void addItems(String catogoryName, ItemModel value) async {
  var itemBox = Hive.box<ItemModel>('$ITEMS$catogoryName');
  await itemBox.put(value.itemId, value);
}
