import 'package:flutter/material.dart';

import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/utils/app_image.dart';

import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/core/widget/default_custom_buttong.dart';
import 'package:ntigradproject/feature/cart/presentation/widget/my_cart.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.specialbackground,

      appBar: AppBar(
        backgroundColor: MyColors.white,
        centerTitle: true,
        title: const Text(AppString.profile),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                AppString.shoppinglist,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
            ),
            OrderCard(
              image: AppImage.ladyorder,
              ordername: AppString.product1name,
              orderrate: AppString.product1rate,
              orderprice: AppString.finalprice1,
              orderoldprice: AppString.oldprice1,
            ),
            OrderCard(
              image: AppImage.manorder,
              ordername: AppString.product2name,
              orderrate: AppString.product2rate,
              orderprice: AppString.finalprice2,
              orderoldprice: AppString.oldprice2,
            ),
            Text(
              style: TextStyle(color: MyColors.gray),
              "_______________________________________________________",
            ),
            Row(
              children: [
                Text(AppString.subtotal),
                Spacer(),
                Text(AppString.subprice),
              ],
            ),
            Row(
              children: [
                Text(AppString.taxfees),
                Spacer(),
                Text(AppString.taxprice),
              ],
            ),
            Row(
              children: [
                Text(AppString.delivery),
                Spacer(),
                Text(AppString.deliveryprice),
              ],
            ),
            Text(
              style: TextStyle(color: MyColors.gray),
              "_______________________________________________________",
            ),
            Row(
              children: [
                Text(AppString.totalorder),
                Spacer(),
                Text(AppString.totalordersprice),
              ],
            ),
            SizedBox(height: 25),
            DefaultCustomButtong(text: AppString.checkout),
          ],
        ),
      ),
    );
  }
}
