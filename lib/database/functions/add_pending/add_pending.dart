import 'package:event_vault/database/modals/pending_model/pending_model.dart';
import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

const String PENDING_EVENT = 'pending box';

ValueNotifier<List<PendingEvents>> pendingEventsListener = ValueNotifier([]);
var pendingEventsBox = Hive.box<PendingEvents>(PENDING_EVENT);

addPendingEvents(PendingEvents value) {
  pendingEventsBox.put(value.pendingID, value);
  getAllPendings();
}

getAllPendings() {
  pendingEventsListener.value.clear();
  pendingEventsListener.value = pendingEventsBox.values.toList();
  pendingEventsListener.notifyListeners();
}

removePendings(String id) {
  pendingEventsBox.delete(id);
  getAllPendings();
}
