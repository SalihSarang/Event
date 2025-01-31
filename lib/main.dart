import 'package:event_vault/costum_widgets/color%20palette/color_palette.dart';
import 'package:event_vault/database/functions/add_catogory/add_catogory.dart';
import 'package:event_vault/database/functions/add_event/add_event.dart';
import 'package:event_vault/database/functions/add_items/add_items.dart';
import 'package:event_vault/database/modals/catogory_model/catogory_model.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/database/modals/item_model/item_model.dart';
import 'package:event_vault/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(EventAddModalAdapter());

  Hive.registerAdapter(CatogoryModelAdapter());

  Hive.registerAdapter(ItemModelAdapter());

  await Hive.openBox<EventAddModal>(ADD_EVENT);
  await Hive.openBox<CatogoryModel>(CATEGORY);
  await Hive.openBox<ItemModel>(ITEMS);
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
        scaffoldBackgroundColor: ColorPalette.mainBg,
      ),
      debugShowCheckedModeBanner: false,
      home: BottomNavigation(),
    );
  }
}
