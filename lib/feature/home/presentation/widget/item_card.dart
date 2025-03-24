import 'package:flutter/material.dart';
import 'package:givestarreviews/givestarreviews.dart';
import 'package:ntigradproject/core/theme/app_text_style.dart';
import 'package:ntigradproject/core/utils/app_image.dart';
import 'package:ntigradproject/core/utils/app_string.dart';

class ItemCard extends StatelessWidget {
  const ItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.196,
            width: MediaQuery.of(context).size.width * 0.434,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImage.shirt),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(AppString.mensstarry, style: AppTextStyle.regularDark16),
          Text(AppString.describtion, style: AppTextStyle.regulardark12),
          Text(AppString.price, style: AppTextStyle.regulardark12),
          StarRating(onChanged: (rate) {}),
        ],
      ),
    );
  }
}
