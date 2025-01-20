import 'package:hive_flutter/adapters.dart';
part 'decoration_model.g.dart';

@HiveType(typeId: 2)
class DecorationModel {
  @HiveField(0)
  String budget;
  @HiveField(1)
  String selectedMenu;
  @HiveField(2)
  String specialRequirements;
  DecorationModel(
      {required this.budget,
      required this.selectedMenu,
      required this.specialRequirements});
}
