import 'package:flutter/material.dart';
import 'package:item_count_number_button/item_count_number_button.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/utils/app_string.dart';

class OrderCard extends StatelessWidget {
  const OrderCard({
    super.key,
    required this.image,
    required this.ordername,
    required this.orderrate,
    required this.orderprice,
    required this.orderoldprice,
  });
  final String image;
  final String ordername;
  final String orderrate;
  final String orderprice;
  final String orderoldprice;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 17, top: 10, bottom: 7, right: 17),
      padding: EdgeInsets.all(10),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.26,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: MyColors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 14,
            spreadRadius: -8,
            offset: Offset(0, 6),
            color: MyColors.shadow,
          ),
          BoxShadow(
            blurRadius: 9,
            spreadRadius: -7,
            offset: Offset(0, -4),
            color: MyColors.shadow,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.345,
                height: MediaQuery.of(context).size.height * 0.154,
                decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage(image)),
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ordername,
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Text(orderrate),
                      Icon(Icons.star, color: MyColors.yellow),
                    ],
                  ),
                  SizedBox(height: 12),
                  Row(
                    children: [
                      Text(
                        orderprice,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        orderoldprice,
                        style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: MyColors.pricegray,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  SizedBox(height: 10),
                  Row(
                    children: [
                      SizedBox(width: 80),
                      ItemCount(
                        color: MyColors.red,
                        initialValue: 1,
                        step: 1,
                        minValue: 1,
                        maxValue: 10,
                        decimalPlaces: 0,
                        onChanged: (value) {
                          //using cubit to change the  value
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          Text(
            style: TextStyle(color: MyColors.gray),
            "_______________________________________________",
          ),

          Row(
            children: [
              Text(
                AppString.totalorder,
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 12),
              ),
              SizedBox(width: 170),
              Text(
                orderprice,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
