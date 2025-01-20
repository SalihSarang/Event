import 'package:event_vault/database/functions/add_catering/add_catering.dart';
import 'package:event_vault/database/functions/add_catering_menu/add_catering_menu.dart';
import 'package:event_vault/database/functions/add_decoration/add_decoration.dart';
import 'package:event_vault/database/functions/add_decoration_manu/add_decoration_manu.dart';
import 'package:event_vault/database/functions/add_event/add_event.dart';
import 'package:event_vault/database/functions/add_party/add_party.dart';
import 'package:event_vault/database/modals/catogorys_model/catering_model/catering_add_menu/catering_add_menu.dart';
import 'package:event_vault/database/modals/catogorys_model/catering_model/catering_model.dart';
import 'package:event_vault/database/modals/catogorys_model/decoration_model/decoration_menu_add/decoration_menu_add.dart';
import 'package:event_vault/database/modals/catogorys_model/decoration_model/decoration_model.dart';
import 'package:event_vault/database/modals/catogorys_model/party_model/party_model.dart';
import 'package:event_vault/database/modals/event_adding/event_adding_modal.dart';
import 'package:event_vault/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(EventAddingModalAdapter());
  await Hive.openBox<EventAddingModal>(ADD_EVENT);

  Hive.registerAdapter(CataringMenuModelAdapter());
  await Hive.openBox<CataringMenuModel>(CATARING);

  Hive.registerAdapter(DecorationModelAdapter());
  await Hive.openBox<DecorationModel>(DECORATION);

  Hive.registerAdapter(PartyModelAdapter());
  await Hive.openBox<PartyModel>(PARTY);

  Hive.registerAdapter(CateringAddMenuAdapter());
  await Hive.openBox<CateringAddMenu>(CATARING_MENU);

  Hive.registerAdapter(DecorationMenuAddAdapter());
  await Hive.openBox<DecorationMenuAdd>(DECORATION_MENU);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ScreenMain(),
    );
  }
}
