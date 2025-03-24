import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/feature/orders/presentation/sharedwidget/category_selected.dart';
import 'package:ntigradproject/feature/orders/presentation/sharedwidget/default_appbar.dart';
import 'package:ntigradproject/feature/orders/presentation/sharedwidget/default_info.dart';

class MyOrdersCancelView extends StatelessWidget {
  const MyOrdersCancelView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isCancel = true;
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppBar(context, title: AppString.myorder),
        body: Column(
          children: [
            categorySelectWidget(context, isCancelled: isCancel),
            SizedBox(height: 44),
            // noFoundOrder(context),
            Expanded(
              child: ListView(children: [DefaultInfoOrder(isCancel: isCancel)]),
            ),
          ],
        ),
      ),
    );
  }
}
