import 'package:flutter/material.dart';
import 'package:ntigradproject/core/function/app_route.dart';
import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/feature/orders/presentation/my_order_cancel.dart';
import 'package:ntigradproject/feature/orders/presentation/order_detials_completed_view.dart';
import 'package:ntigradproject/feature/orders/presentation/sharedwidget/default__page_order.dart';
import 'package:ntigradproject/feature/orders/presentation/sharedwidget/default_appbar.dart';
import 'package:ntigradproject/feature/orders/presentation/sharedwidget/default_elv_button.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

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
          child: Column(
            children: [
              defaultPageOrder(context: context, satuesTitle: AppString.active),
              SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: Row(
                  spacing: 22,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    defaultEvelButt(
                      title: AppString.canceledOrder,
                      onPress: () {
                        AppRoute.navigateTo(MyOrdersCancelView());
                      },
                    ),
                    defaultEvelButt(
                      title: AppString.trackDriver,
                      onPress: () {
                        AppRoute.navigateTo(OrderDetailsCompleteView());
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
