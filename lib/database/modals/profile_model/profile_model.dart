import 'package:hive/hive.dart';
part 'profile_model.g.dart';

@HiveType(typeId: 9)
class ProfileModel {
  @HiveField(0)
  String profileName;
  @HiveField(1)
  String phoneNumber;
  @HiveField(2)
  String email;
  @HiveField(3)
  String businessAddress;
  @HiveField(4)
  String profileId;
  @HiveField(5)
  String image;
  ProfileModel(
      {required this.profileName,
      required this.phoneNumber,
      required this.email,
      required this.businessAddress,
      required this.profileId,
      required this.image});
}
