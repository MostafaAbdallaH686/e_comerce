import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ntigradproject/core/theme/app_text_style.dart';
import 'package:ntigradproject/core/utils/app_icon.dart';
import 'package:ntigradproject/core/utils/app_string.dart';

Widget noFoundOrder(BuildContext context) {
  return Column(
    children: [
      SizedBox(height: 130),
      Column(
        children: [
          SvgPicture.asset(AppIcon.noOrder, width: 140, height: 167),
          SizedBox(height: 40),
          SizedBox(
            width: 288,
            child: Text(
              AppString.graphOreder,
              textAlign: TextAlign.center,
              style: AppTextStyle.regular30,
            ),
          ),
        ],
      ),
    ],
  );
}
