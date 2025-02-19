import 'dart:io';
import 'package:event_vault/database/functions/profile/profile.dart';
import 'package:event_vault/database/modals/profile_model/profile_model.dart';
import 'package:event_vault/utils/validation/event_adding/client_info/number_validation/number_validation.dart';
import 'package:event_vault/utils/validation/event_adding/event_name/event_name.dart';
import 'package:event_vault/widgets/unique_id/unique_id.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:event_vault/utils/font/app_font.dart';
import 'package:event_vault/widgets/app_theme/app_theme.dart';
import 'package:event_vault/widgets/text_field/text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final profileNameCtrl = TextEditingController();
  final phoneNumberCtrl = TextEditingController();
  final emailCtrl = TextEditingController();
  final businessAddressCtrl = TextEditingController();
  final profielFormKey = GlobalKey<FormState>();

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
    _loadProfile();
  }

  // Load the saved profile from Hive
  void _loadProfile() {
    final savedProfile = profileBox.get('profile');
    if (savedProfile != null) {
      setState(() {
        profileNameCtrl.text = savedProfile.profileName;
        phoneNumberCtrl.text = savedProfile.phoneNumber;
        emailCtrl.text = savedProfile.email;
        businessAddressCtrl.text = savedProfile.businessAddress;
        if (savedProfile.image.isNotEmpty) {
          _imageFile = File(savedProfile.image);
        }
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: _pickImage,
                  child: imageField(),
                ),
                const SizedBox(height: 20),
                Form(
                  key: profielFormKey,
                  child: Column(
                    children: [
                      myField(
                          validationMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => eventNameValidation(value),
                          hint: 'Enter Profile Name',
                          fieldTitle: 'Name',
                          controller: profileNameCtrl),
                      myField(
                          validationMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => isValidPhoneNumber(value),
                          keyboardType: TextInputType.number,
                          maxLength: 10,
                          hint: 'Enter Phone Number',
                          fieldTitle: 'Phone Number',
                          controller: phoneNumberCtrl),
                      myField(
                          validationMode: AutovalidateMode.onUserInteraction,
                          validator: (value) => validateEmail(value),
                          hint: 'Enter E-mail ',
                          fieldTitle: 'E-mail',
                          controller: emailCtrl),
                      myField(
                          validationMode: AutovalidateMode.onUserInteraction,
                          hint: 'Enter Your Business Address',
                          fieldTitle: 'Business Address',
                          controller: businessAddressCtrl),
                    ],
                  ),
                ),
                SizedBox(
                  width: 175,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                        side: const BorderSide(width: 0),
                      ),
                      backgroundColor: AppTheme.hilite,
                    ),
                    onPressed: () {
                      if (profielFormKey.currentState!.validate()) {
                        final profile = ProfileModel(
                          profileName: profileNameCtrl.text,
                          phoneNumber: phoneNumberCtrl.text,
                          email: emailCtrl.text,
                          businessAddress: businessAddressCtrl.text,
                          profileId: generateID(),
                          image: _imageFile?.path ?? '',
                        );

                        addProfile(profile);
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Save Profile', style: myFontColor(size: 18)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget imageField() {
    return Container(
      height: 250,
      width: 250,
      decoration: BoxDecoration(
        color: AppTheme.hint,
        shape: BoxShape.circle,
        image: _imageFile != null
            ? DecorationImage(image: FileImage(_imageFile!), fit: BoxFit.cover)
            : null,
      ),
      child: _imageFile == null
          ? Icon(Icons.camera_alt, size: 40, color: Colors.white)
          : null,
    );
  }
}
