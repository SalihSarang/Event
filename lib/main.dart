import 'package:event_vault/database/functions/%20add_task/add_task.dart';
import 'package:event_vault/database/functions/add_catogory/add_catogory.dart';
import 'package:event_vault/database/functions/add_event/add_event.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:event_vault/database/modals/task_model/task_model.dart';
import 'package:event_vault/screens/home/bottom_nav.dart';
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

  await Hive.openBox<EventAddModal>(ADD_EVENT);
  await Hive.openBox<CatogoryModel>(CATEGORY);
  await Hive.openBox<ItemModel>(ITEMS);
  await Hive.openBox<Task>(TASK_BOX);
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
