import 'package:flutter/material.dart';
import 'package:ntigradproject/core/function/app_svg_image.dart';
import 'package:ntigradproject/core/utils/app_distance.dart';
import 'package:ntigradproject/core/utils/app_icon.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({super.key, this.onTap});
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(Icons.arrow_back_ios),
      // AppSvgImage.showSvgImage(
      //   path:"assets\icons\arrow_back.svg",
      //   // width: AppWidth.w14,
      //   // height: AppHeight.h8,
      //   fit: BoxFit.scaleDown,
      // ),
    );
  }
}
