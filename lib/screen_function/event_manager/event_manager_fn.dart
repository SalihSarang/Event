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
