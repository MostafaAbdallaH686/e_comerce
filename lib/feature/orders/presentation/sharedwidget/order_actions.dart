import 'package:flutter/material.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';

class OrderActions extends StatelessWidget {
  const OrderActions({super.key, required this.text});
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 25,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38),
        color: MyColors.red,
      ),
      child: Center(
        child: Text(
          text,
          style: TextStyle(
            color: MyColors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
