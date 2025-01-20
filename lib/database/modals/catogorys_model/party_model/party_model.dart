import 'package:event_vault/database/modals/catogorys_model/catering_model/catering_model.dart';
import 'package:event_vault/database/modals/catogorys_model/decoration_model/decoration_model.dart';
import 'package:hive_flutter/adapters.dart';
part 'party_model.g.dart';

@HiveType(typeId: 3)
class PartyModel {
  @HiveField(0)
  String partyName;
  @HiveField(1)
  String guestCount;
  @HiveField(2)
  String budget;
  @HiveField(3)
  CataringMenuModel cateringDetails;
  @HiveField(4)
  DecorationModel decorationDetails;
  PartyModel(
      {required this.partyName,
      required this.guestCount,
      required this.budget,
      required this.cateringDetails,
      required this.decorationDetails});
}
