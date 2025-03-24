import 'package:flutter/material.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/theme/app_text_style.dart';

Widget defaultEvelButt({required String title, required Function() onPress}) {
  {
    return SizedBox(
      height: 21,
      width: 116,
      child: ElevatedButton(
        onPressed: onPress,
        style: ElevatedButton.styleFrom(backgroundColor: MyColors.red),
        child: Text(
          textAlign: TextAlign.center,
          title,
          style: AppTextStyle.elevatedButton,
        ),
      ),
    );
  }
}
