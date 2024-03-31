import 'package:ecommerce_app/core/constants/app_tranlsations_keys.dart';
import 'package:ecommerce_app/features/language/views/widgets/language_list.dart';
import 'package:ecommerce_app/features/profile/views/profile_settings_view.dart';
import 'package:ecommerce_app/features/profile/views/widgets/profile_app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileLanguageView extends StatelessWidget {
  const ProfileLanguageView({super.key});

  static int id = 5;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: [
          ProfileAppBar(
            title: AppTranslationsKeys.tabProfileSettingsLanguage.tr,
            profileId: ProfileSettingsView.id,
          ),
          const SizedBox(height: 30),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24),
            child: LanguageList(),
          ),
        ],
      ),
    );
  }
}
