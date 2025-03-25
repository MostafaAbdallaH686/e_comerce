import 'package:flutter/material.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/utils/app_image.dart';
import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/core/widget/default_custom_buttong.dart';
import 'package:ntigradproject/feature/cart/presentation/widget/order_cart.dart';

class CheckoutView extends StatelessWidget {
  const CheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.specialbackground,

      appBar: AppBar(
        backgroundColor: MyColors.white,
        centerTitle: true,
        title: const Text(AppString.checkout),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [Icon(Icons.map), Text(AppString.delevadd)]),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(10),
                  width: MediaQuery.of(context).size.width * 0.64,
                  height: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    color: MyColors.white,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [Text(AppString.add), Text(AppString.addtitle)],
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.22,
                  height: MediaQuery.of(context).size.width * 0.2,
                  decoration: BoxDecoration(
                    color: MyColors.red,
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: Icon(Icons.map, color: MyColors.white),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Text(
                AppString.shoppinglist,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
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
            SizedBox(height: 25),
            DefaultCustomButtong(text: AppString.placeorder),
          ],
        ),
      ),
    );
  }
}
