import 'package:flutter/material.dart';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ntigradproject/core/cache_helper/cache-helper.dart';
import 'package:ntigradproject/core/function/app_route.dart';
import 'package:ntigradproject/core/helper/cache_helper.dart';
import 'package:ntigradproject/core/helper/shared_preferenece_key.dart';
import 'package:ntigradproject/core/utils/app_icon.dart';
import 'package:ntigradproject/core/utils/app_image.dart';
import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/feature/orders/presentation/my_order_view.dart';
import 'package:ntigradproject/feature/orders/presentation/no_orders_screen.dart';
import 'package:ntigradproject/feature/profile/presenation/setting.dart';
import 'package:ntigradproject/feature/profile/presenation/widget/my_profile_view.dart';
import 'package:ntigradproject/feature/profile/presenation/widget/profile_card.dart';

class MainProfile extends StatefulWidget {
  const MainProfile({super.key});

  @override
  State<MainProfile> createState() => _MainProfileState();
}

class _MainProfileState extends State<MainProfile> {
  Helper cacheHelper = Helper();

  String name = 'full name';

  @override
  void initState() {
    log("Profile");
    name =
        cacheHelper.getDataString(key: SharedPrefereneceKey.name) ?? "No Name";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          AppString.profile,
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 30),
            Center(
              child: CircleAvatar(
                radius: MediaQuery.of(context).size.width * 0.256,
                backgroundImage: AssetImage(AppImage.profile1),
              ),
            ),
            SizedBox(height: 20),
            Center(child: Text(name)),
            SizedBox(height: 30),
            ProfileCard(
              icon: AppIcon.username1,
              text: AppString.myprofile,
              screen: () => AppRoute.navigateTo(MyProfileView()),
            ),

            ProfileCard(
              icon: AppIcon.profilebag1,
              text: AppString.myorder,
              screen: () {
                AppRoute.navigateTo(NoOrdersScreen());
              },
            ),
            ProfileCard(icon: AppIcon.fav1, text: AppString.favorite),
            ProfileCard(
              icon: AppIcon.setting1,
              text: AppString.settings,
              screen: () => AppRoute.navigateTo(SettingsView()),
            ),
            SizedBox(height: 20),
            Center(child: SvgPicture.asset(AppIcon.line1)),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.only(left: 26, right: 26, bottom: 36),
              width: double.infinity,
              height: 26,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppIcon.logout1),
                  SizedBox(width: 10),
                  Text(AppString.logOut),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
