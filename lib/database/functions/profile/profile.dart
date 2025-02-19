import 'package:event_vault/database/modals/profile_model/profile_model.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

const PROFILE_BOX = 'profile_box';
ValueNotifier<ProfileModel?> profileListener = ValueNotifier(null);
var profileBox = Hive.box<ProfileModel>(PROFILE_BOX);

addProfile(ProfileModel value) {
  profileBox.put('profile', value);
  profileListener.value = value;
  profileListener.notifyListeners();
}

getProfile() {
  profileListener.value = profileBox.get('profile');
  profileListener.notifyListeners();
}
