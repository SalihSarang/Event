import 'package:event_vault/database/functions/add_event/add_event.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';

List<EventAddModal> filterSearchEvent({
  required List<EventAddModal> result,
  required String search,
}) {
  return result
      .where((event) =>
          event.categoryName.toLowerCase().contains(search.toLowerCase()))
      .toList();
}

searchEvent({required String search, required List<EventAddModal> eventList}) {
  List<EventAddModal> searchedEvents = [];
  if (search.isNotEmpty) {
    searchedEvents = eventList.where((event) {
      final eventName = event.eventName.toLowerCase().contains(search);
      final eventDate = event.date.toString().toLowerCase().contains(search);
      // final eventCategory = event.catogory.toLowerCase().contains(search);
      // final eventLocation = event.location.toLowerCase().contains(search);
      return eventName;
    }).toList();
  } else {
    searchedEvents = eventListen.value;
  }
  return searchedEvents;
}
