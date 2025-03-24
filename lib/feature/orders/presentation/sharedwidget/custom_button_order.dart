import 'package:flutter/material.dart';
import 'package:ntigradproject/core/function/app_width_height.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/theme/app_text_style.dart';
import 'package:ntigradproject/core/utils/app_padding.dart';
import 'package:ntigradproject/core/utils/app_radius.dart';

class CustomButtonOrder extends StatelessWidget {
  const CustomButtonOrder({super.key, required this.text, this.onTap});
  final String text;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: AppWidthHeight.persantageOfWidth((100 / 375) * 100),
        height: AppWidthHeight.persantageOfHeight((23 / 375) * 100),
        padding: AppPadding.buttonVerticalPadding10,
        decoration: BoxDecoration(
          color: MyColors.pink,
          borderRadius: AppRadius.homeCardRaduis,
          // // boxShadow: [
          // //   BoxShadow(
          // //     offset: Offset(0, 4),
          // //     //  color: MyColors.red.withAlpha(120),
          // //     blurRadius: 7,
          // //     spreadRadius: 1,
          // //   ),
          // ],
        ),
        child: Center(child: Text(text, style: AppTextStyle.regular17)),
      ),
    );
    ;
  }
}
