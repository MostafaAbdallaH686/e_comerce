import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/feature/orders/presentation/sharedwidget/category_selected.dart';
import 'package:ntigradproject/feature/orders/presentation/sharedwidget/default_appbar.dart';
import 'package:ntigradproject/feature/orders/presentation/sharedwidget/default_info.dart';

class MyOrdersComplView extends StatelessWidget {
  const MyOrdersComplView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isComplete = true;
    return SafeArea(
      child: Scaffold(
        appBar: defaultAppBar(context, title: AppString.myorder),
        body: Column(
          children: [
            categorySelectWidget(context, isCompleted: isComplete),
            SizedBox(height: 44),
            Expanded(
              child: ListView(
                children: [DefaultInfoOrder(isCompleted: isComplete)],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
