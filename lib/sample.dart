import 'package:event_vault/database/functions/add_catogory/add_catogory.dart';
import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<CatogoryModel>> listenCategory = ValueNotifier([]);

sample() async {
  await Hive.openBox<CatogoryModel>(CATEGORY);
  var categoryBox = Hive.box<CatogoryModel>(CATEGORY);
  listenCategory.value.addAll(categoryBox.values);
}
