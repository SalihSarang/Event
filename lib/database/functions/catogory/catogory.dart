import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'dart:developer' as developer;

const CATEGORY = 'category';

ValueNotifier<List<CatogoryModel>> catogoryListener = ValueNotifier([]);
var categoryBox = Hive.box<CatogoryModel>(CATEGORY);

void addCategory(CatogoryModel value) async {
  developer.log('${value.name} ${value.catogoryId}');
  await categoryBox.put(value.catogoryId, value);
  getAllCategories();
}

void getAllCategories() {
  catogoryListener.value = categoryBox.values.toList();
  catogoryListener.notifyListeners();
}

void upDateCategprys(CatogoryModel value) async {
  developer.log('${value.name} ${value.catogoryId}');
  await categoryBox.put(value.catogoryId, value);
  getAllCategories();
}

void deleteCategory(String value) async {
  await categoryBox.delete(value);
  getAllCategories();
}
