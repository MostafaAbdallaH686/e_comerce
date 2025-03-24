import 'package:flutter/material.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/theme/app_text_style.dart';
import 'package:ntigradproject/core/utils/app_padding.dart';
import 'package:ntigradproject/core/utils/app_radius.dart';

class DefaultCustomButtong extends StatelessWidget {
  const DefaultCustomButtong({
    super.key,
    required this.text,
    this.onTap,
    this.radius,
  });
  final String text;
  final void Function()? onTap;
  final BorderRadius? radius;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: AppPadding.buttonVerticalPadding10,
        decoration: BoxDecoration(
          color: MyColors.red,
          borderRadius: radius,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 4),
              color: MyColors.red.withAlpha(220),
              blurRadius: 7,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Center(child: Text(text, style: AppTextStyle.light20())),
      ),
    );
  }
}
