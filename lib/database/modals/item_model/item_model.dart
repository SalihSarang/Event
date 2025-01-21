import 'package:hive/hive.dart';
part 'item_model.g.dart';

@HiveType(typeId: 2)
class ItemModel {
  @HiveField(0)
  String itemName;
  @HiveField(1)
  String itemPrice;
  @HiveField(2)
  int itemId;
  ItemModel(
      {required this.itemName, required this.itemPrice, required this.itemId});
}
