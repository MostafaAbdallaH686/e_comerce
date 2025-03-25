import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/utils/app_icon.dart';
import 'package:ntigradproject/core/utils/app_image.dart';
import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/feature/orders/presentation/sharedwidget/order_status.dart';

class CompleteView extends StatelessWidget {
  const CompleteView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyColors.white,
        centerTitle: true,
        title: const Text(AppString.profile),
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: Column(
        children: [
          SizedBox(height: 30),
          Row(
            children: [
              OrderStatus(
                color: MyColors.pink,
                text: Text(
                  AppString.active,
                  style: TextStyle(
                    color: MyColors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
              OrderStatus(
                color: MyColors.red,
                text: Text(
                  AppString.compl,
                  style: TextStyle(
                    color: MyColors.white,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
              OrderStatus(
                color: MyColors.pink,
                text: Text(
                  AppString.cancelled,
                  style: TextStyle(
                    color: MyColors.red,
                    fontWeight: FontWeight.w500,
                    fontSize: 17,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          Container(
            width: double.infinity,
            height: MediaQuery.of(context).size.height * 0.130,
            margin: EdgeInsets.symmetric(horizontal: 20),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),

              color: MyColors.white,
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  offset: Offset(0, 3),
                  spreadRadius: 0,
                  color: MyColors.shadow,
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(right: 10),
                  width: MediaQuery.of(context).size.width * 0.275,
                  height: MediaQuery.of(context).size.height * 0.130,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                      image: AssetImage(AppImage.shirt),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          AppString.mensstarry,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(width: 100),
                        Text(
                          AppString.itemprice,
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        Text(
                          AppString.orderdate,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                        SizedBox(width: 90),
                        Text(
                          AppString.itemcount,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SvgPicture.asset(
                          AppIcon.correct,
                          width: 15,
                          height: 15,
                          color: MyColors.red,
                        ),
                        SizedBox(width: 5),
                        Text(
                          AppString.orderdelivered,
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            color: MyColors.red,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
