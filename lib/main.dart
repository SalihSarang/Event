import 'package:event_vault/database/functions/%20add_task/add_task.dart';
import 'package:event_vault/database/functions/add_catogory/add_catogory.dart';
import 'package:event_vault/database/functions/add_completed/add_completed.dart';
import 'package:event_vault/database/functions/add_event/add_event.dart';
import 'package:event_vault/database/functions/add_event_task/add_event_task.dart';
import 'package:event_vault/database/functions/add_expense/add_expense.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:event_vault/database/functions/add_pending/add_pending.dart';
import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';
import 'package:event_vault/database/modals/completed_events_model/completed.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/database/modals/event_task_model/event_task_model.dart';
import 'package:event_vault/database/modals/expense_model/expense_model.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:event_vault/database/modals/pending_model/pending_model.dart';
import 'package:event_vault/database/modals/task_model/task_model.dart';
import 'package:event_vault/screens/bottom_vav/bottom_nav.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(EventAddModalAdapter());
  Hive.registerAdapter(CatogoryModelAdapter());
  Hive.registerAdapter(ItemModelAdapter());
  Hive.registerAdapter(TaskAdapter());
  Hive.registerAdapter(CompletedAdapter());
  Hive.registerAdapter(PendingEventsAdapter());
  Hive.registerAdapter(EventTaskModelAdapter());
  Hive.registerAdapter(ExpenseModelAdapter());

  await Hive.openBox<EventAddModal>(ADD_EVENT);
  await Hive.openBox<CatogoryModel>(CATEGORY);
  await Hive.openBox<ItemModel>(ITEMS);
  await Hive.openBox<Task>(TASK_BOX);
  await Hive.openBox<Completed>(COMPLETED_EVENTS);
  await Hive.openBox<PendingEvents>(PENDING_EVENT);
  await Hive.openBox<EventTaskModel>(EVENT_TASK_BOX);
  await Hive.openBox<ExpenseModel>(EXPENSE_BOX);

  getAllEvents();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(),
        scaffoldBackgroundColor: AppTheme.mainBg,
      ),
      debugShowCheckedModeBanner: false,
      home: BottomNavigation(),
    );
  }
}
