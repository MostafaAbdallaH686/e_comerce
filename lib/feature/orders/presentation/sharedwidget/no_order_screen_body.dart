import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ntigradproject/core/localization/app_string_keys.dart';
import 'package:ntigradproject/core/theme/app_text_style.dart';
import 'package:ntigradproject/core/utils/app_distance.dart';
import 'package:ntigradproject/core/utils/app_icon.dart';
import 'package:ntigradproject/core/utils/app_padding.dart';
import 'package:ntigradproject/feature/orders/presentation/sharedwidget/custom_button_order.dart';

class NoOrderScreenBody extends StatelessWidget {
  const NoOrderScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: AppHeight.h20),
        Padding(
          padding: AppPadding.screenPaddingHorizonta22,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomButtonOrder(text: AppStringKeys.active),
              CustomButtonOrder(text: AppStringKeys.completed),
              CustomButtonOrder(text: AppStringKeys.cancelled),
            ],
          ),
        ),
        SizedBox(height: AppHeight.h67),
        SvgPicture.asset(AppIcon.noOrder),
        SizedBox(height: AppHeight.h25),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(AppStringKeys.noordertext1, style: AppTextStyle.regular30),
          ],
        ),
      ],
    );
  }
}
