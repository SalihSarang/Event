import 'package:hive_flutter/adapters.dart';
part 'decoration_menu_add.g.dart';

@HiveType(typeId: 5)
class DecorationMenuAdd {
  @HiveField(0)
  String decorationItem;
  @HiveField(1)
  String quantity;
  @HiveField(2)
  String price;
  DecorationMenuAdd(
      {required this.decorationItem,
      required this.quantity,
      required this.price});
}
