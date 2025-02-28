import 'package:event_vault/database/functions/event/event.dart';
import 'package:hive/hive.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:event_vault/database/modals/task_model/task_model.dart';
import 'package:event_vault/database/modals/completed_events_model/completed.dart';
import 'package:event_vault/database/modals/pending_model/pending_model.dart';
import 'package:event_vault/database/modals/event_task_model/event_task_model.dart';
import 'package:event_vault/database/modals/expense_model/expense_model.dart';
import 'package:event_vault/database/modals/profit_model/event_profit_model.dart';
import 'package:event_vault/database/modals/profile_model/profile_model.dart';
import 'package:event_vault/database/functions/%20task/task.dart';
import 'package:event_vault/database/functions/catogory/catogory.dart';
import 'package:event_vault/database/functions/completed/completed.dart';
import 'package:event_vault/database/functions/event_profit/event_profit.dart';
import 'package:event_vault/database/functions/event_task/event_task.dart';
import 'package:event_vault/database/functions/expense/expense.dart';
import 'package:event_vault/database/functions/items/items.dart';
import 'package:event_vault/database/functions/pending/pending.dart';
import 'package:event_vault/database/functions/profile/profile.dart';

openDataBaseBox() async {
  // Register adapters
  Hive.registerAdapter(EventAddModalAdapter());
  Hive.registerAdapter(CatogoryModelAdapter());
  Hive.registerAdapter(ItemModelAdapter());
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(CompletedAdapter());
  Hive.registerAdapter(PendingEventsAdapter());
  Hive.registerAdapter(EventTaskModelAdapter());
  Hive.registerAdapter(ExpenseModelAdapter());
  Hive.registerAdapter(EventProfitModelAdapter());
  Hive.registerAdapter(ProfileModelAdapter());

  // Open boxes
  await Hive.openBox<EventAddModal>(ADD_EVENT);
  await Hive.openBox<CatogoryModel>(CATEGORY);
  await Hive.openBox<ItemModel>(ITEMS);
  await Hive.openBox<Task>(TASK_BOX);
  await Hive.openBox<Completed>(COMPLETED_EVENTS);
  await Hive.openBox<PendingEvents>(PENDING_EVENT);
  await Hive.openBox<EventTaskModel>(EVENT_TASK_BOX);
  await Hive.openBox<ExpenseModel>(EXPENSE_BOX);
  await Hive.openBox<EventProfitModel>(EVENT_PROFIT);
  await Hive.openBox<ProfileModel>(PROFILE_BOX);

  getAllEvents();
}
