import 'package:flutter/material.dart';
import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/feature/orders/presentation/sharedwidget/default__page_order.dart';
import 'package:ntigradproject/feature/orders/presentation/sharedwidget/default_appbar.dart';

class OrderDetailsCompleteView extends StatelessWidget {
  const OrderDetailsCompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: defaultAppBar(context, title: AppString.orderDetails),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsetsDirectional.only(
            end: 22,
            start: 22,
            top: 30,
            bottom: 13,
          ),
          child: defaultPageOrder(
            context: context,
            satuesTitle: AppString.completed,
          ),
        ),
      ),
    );
  }
}
