import 'package:hive_flutter/hive_flutter.dart';
part 'catogory_model.g.dart';

@HiveType(typeId: 1)
class CatogoryModel {
  @HiveField(0)
  String name;
  @HiveField(2)
  String catogoryId;
  @HiveField(3)
  String description;
  CatogoryModel(
      {required this.name,
      required this.catogoryId,
      required this.description});
}
