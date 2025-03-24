import 'package:flutter/material.dart';
import 'package:ntigradproject/core/function/app_route.dart';
import 'package:ntigradproject/core/localization/app_string_keys.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/theme/app_text_style.dart';
import 'package:ntigradproject/core/widget/custom_arrow_back.dart';
import 'package:ntigradproject/feature/orders/presentation/sharedwidget/no_order_screen_body.dart';

class NoOrdersScreen extends StatelessWidget {
  const NoOrdersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.white,
      appBar: AppBar(
        backgroundColor: MyColors.white,
        centerTitle: true,
        title: Text(AppStringKeys.myOrders, style: AppTextStyle.regular18),
        leading: CustomArrowBack(onTap: AppRoute.navigateBack),
      ),
      body: NoOrderScreenBody(),
    );
  }
}
