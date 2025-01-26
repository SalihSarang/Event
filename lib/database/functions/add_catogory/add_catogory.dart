import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

const CATEGORY = 'category';

ValueNotifier<List<CatogoryModel>> catogoryListener = ValueNotifier([]);

void addCategory(CatogoryModel value) async {
  var categoryBox = Hive.box<CatogoryModel>(CATEGORY);
  print({value.name, value.catogoryId});
  await categoryBox.put(value.catogoryId, value);
  getAllCategories();
}

void getAllCategories() {
  var categoryBox = Hive.box<CatogoryModel>(CATEGORY);
  catogoryListener.value = categoryBox.values.toList();
  catogoryListener.notifyListeners();
}

void upDateCategprys(CatogoryModel value) async {
  var categoryBox = Hive.box<CatogoryModel>(CATEGORY);
  print({value.name, value.catogoryId});
  await categoryBox.put(value.catogoryId, value);
  getAllCategories();
}

void deleteCategory(String value) async {
  var categoryBox = Hive.box<CatogoryModel>(CATEGORY);
  await categoryBox.delete(value);
  getAllCategories();
}
