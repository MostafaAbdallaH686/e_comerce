import 'package:flutter/material.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/utils/app_image.dart';
import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/feature/cart/presentation/widget/order_cart.dart';
import 'package:ntigradproject/feature/orders/presentation/sharedwidget/order_status.dart';

class OrderDetailsView extends StatelessWidget {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        centerTitle: true,
        title: const Text(AppString.myordertitle),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 14.0, right: 14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  AppString.ordernum,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                SizedBox(width: 170),
                Text(
                  AppString.active,
                  style: TextStyle(
                    color: MyColors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Text(
              AppString.orderdate2,
              style: TextStyle(
                color: MyColors.datecolor,
                fontSize: 14,
                fontWeight: FontWeight.w300,
              ),
            ),
            OrderCard2(
              image: AppImage.ladyorder,
              ordername: AppString.product1name,
              orderrate: AppString.product1rate,
              orderprice: AppString.finalprice1,
              orderoldprice: AppString.oldprice1,
            ),
            OrderCard2(
              image: AppImage.manorder,
              ordername: AppString.product2name,
              orderrate: AppString.product2rate,
              orderprice: AppString.finalprice2,
              orderoldprice: AppString.oldprice2,
            ),
            SizedBox(height: 20),
            Row(
              children: [
                Text(AppString.subtotal),
                Spacer(),
                Text(
                  AppString.subprice,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(AppString.taxfees),
                Spacer(),
                Text(
                  AppString.taxprice,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Text(AppString.delivery),
                Spacer(),
                Text(
                  AppString.deliveryprice,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
              ],
            ),
            Text(
              style: TextStyle(color: MyColors.gray),
              "_______________________________________________________",
            ),
            SizedBox(height: 15),

            Row(
              children: [
                Text(
                  AppString.totalorders,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Spacer(),
                Text(
                  AppString.totalordersprice,
                  style: TextStyle(
                    color: MyColors.red,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            SizedBox(height: 25),
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  OrderStatus(
                    color: MyColors.red,
                    text: Text(
                      "Cancel Order",
                      style: TextStyle(
                        color: MyColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  OrderStatus(
                    color: MyColors.red,
                    text: Text(
                      AppString.trackdriver,
                      style: TextStyle(
                        color: MyColors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
