import 'package:flutter/material.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/theme/app_text_style.dart';

class CustomBottonSectionText extends StatelessWidget {
  const CustomBottonSectionText({
    super.key,
    required this.startText,
    required this.buttonText,
    this.onPressed,
    required this.endText,
    required this.end2Text,
  });
  final String startText;
  final String buttonText;
  final String endText;
  final String end2Text;

  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(startText, style: AppTextStyle.regulardark12),
            TextButton(
              onPressed: onPressed,
              child: Text(buttonText, style: AppTextStyle.registertonpressed),
            ),
            Text(endText, style: AppTextStyle.regulardark12),
          ],
        ),
        Text(endText, style: AppTextStyle.regulardark12),
      ],
    );
  }
}
