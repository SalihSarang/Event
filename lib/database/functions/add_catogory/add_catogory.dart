import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';
import 'package:hive/hive.dart';

const CATOGORY = 'catogory';

void addCatogory(CatogoryModel value) {
  var addCatogory = Hive.box<CatogoryModel>(CATOGORY);
  addCatogory.put(value.catogoryId, value);
}
