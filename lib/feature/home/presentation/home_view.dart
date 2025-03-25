import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/utils/app_icon.dart';

import 'package:ntigradproject/core/utils/app_image.dart';
import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/feature/home/presentation/categories_views.dart';
import 'package:ntigradproject/feature/home/presentation/widget/item_card.dart';

class FinalHomeView extends StatelessWidget {
  const FinalHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  bottomNavigationBar: TestView(),
      backgroundColor: MyColors.specialbackground,
      appBar: AppBar(
        centerTitle: true,

        backgroundColor: MyColors.white,
        title: SvgPicture.asset(AppIcon.homelogo),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 40,
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: MyColors.white,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: TextFormField(
                  onChanged: (value) {},
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    icon: SvgPicture.asset(AppIcon.search),
                    hintText: 'Search any Product',
                    hintStyle: TextStyle(
                      color: MyColors.gray1,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  textDirection: TextDirection.ltr,
                ),
              ),
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

              CarouselSlider(
                items:
                    [1, 2, 3].map((i) {
                      return Builder(
                        builder: (BuildContext context) {
                          return Container(
                            width: MediaQuery.of(context).size.width,
                            margin: EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.amber,
                            ),
                            child: SvgPicture.asset(AppIcon.slider),
                          );
                        },
                      );
                    }).toList(),
                options: CarouselOptions(viewportFraction: 1, autoPlay: true),
              ),
              Center(child: DotsIndicator(dotsCount: 3)),
              Text(
                AppString.recommended,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 15),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(child: Row(children: [ItemCard(), ItemCard()])),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
