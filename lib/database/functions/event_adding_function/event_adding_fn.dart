import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

final ValueNotifier<List<EventAddingModal>> eventlistener = ValueNotifier([]);
const ADD_EVENT = 'addevent';

void eventAdding(EventAddingModal valu) async {
  var eventBox = Hive.box<EventAddingModal>(ADD_EVENT);
}
