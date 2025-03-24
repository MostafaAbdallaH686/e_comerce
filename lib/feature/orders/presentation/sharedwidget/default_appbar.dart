import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/theme/app_text_style.dart';
import 'package:ntigradproject/core/utils/app_icon.dart';

AppBar defaultAppBar(BuildContext context, {required String title}) {
  return AppBar(
    elevation: 0,
    scrolledUnderElevation: 0,
    leading: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(1),
        color: MyColors.white,
        backgroundBlendMode: BlendMode.lighten,
      ),
      width: 10,
      height: 19,
      child: IconButton(
        icon: SvgPicture.asset(AppIcon.arrowBack),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    ),
    title: Text(title, style: AppTextStyle.regular18),
  );
}
