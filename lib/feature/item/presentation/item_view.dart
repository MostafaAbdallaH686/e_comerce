import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/utils/app_icon.dart';
import 'package:ntigradproject/core/utils/app_image.dart';
import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/feature/home/presentation/categories_views.dart';
import 'package:ntigradproject/feature/home/presentation/widget/item_card.dart';

class ItemsView extends StatelessWidget {
  const ItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyColors.specialbackground,
      appBar: AppBar(
        centerTitle: true,

        title: SvgPicture.asset(AppIcon.homelogo),
        backgroundColor: MyColors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 6),
                child: Text(
                  AppString.allfeatured,
                  style: TextStyle(
                    color: MyColors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0, top: 25),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.16,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CategoryView(
                          categorytext: AppString.beauty,
                          image: AppImage.makeup,
                        ),
                        CategoryView(
                          categorytext: AppString.fashion,
                          image: AppImage.women,
                        ),
                        CategoryView(
                          categorytext: AppString.kids,
                          image: AppImage.clothes,
                        ),
                        CategoryView(
                          categorytext: AppString.mens,
                          image: AppImage.room,
                        ),
                        CategoryView(
                          categorytext: AppString.womens,
                          image: AppImage.teshirt,
                        ),
                        CategoryView(
                          categorytext: AppString.gifts,
                          image: AppImage.gift,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Text(
                AppString.products,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Column(
                  children: [
                    Row(children: [ItemCard(), ItemCard()]),
                    Row(children: [ItemCard(), ItemCard()]),
                    Row(children: [ItemCard(), ItemCard()]),
                    Row(children: [ItemCard(), ItemCard()]),
                    Row(children: [ItemCard(), ItemCard()]),
                    Row(children: [ItemCard(), ItemCard()]),
                    Row(children: [ItemCard(), ItemCard()]),
                    Row(children: [ItemCard(), ItemCard()]),
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
