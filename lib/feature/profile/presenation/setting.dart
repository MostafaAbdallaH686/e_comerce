import 'package:flutter/material.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/feature/profile/presenation/widget/lang_card.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        centerTitle: true,
        title: Text(AppString.setting),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Row(
              children: [
                Text(
                  AppString.lang,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                LanguageCard(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
