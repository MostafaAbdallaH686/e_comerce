import 'package:flutter/material.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';

abstract class AppTextStyle {
  static const TextStyle regular24 = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.w400,
    color: MyColors.textblack,
  );

  static const TextStyle regular9 = TextStyle(
    fontSize: 9,
    fontWeight: FontWeight.w400,
    color: MyColors.grey,
  );
  static TextStyle elevatedButton = TextStyle(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: Colors.white,
  );
  static const TextStyle regular12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: MyColors.grey,
  );
  static const TextStyle regular10 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: MyColors.categoryblack,
  );
  static const TextStyle regular14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: MyColors.black,
  );
  static const TextStyle regulardark10 = TextStyle(
    fontSize: 10,
    fontWeight: FontWeight.w400,
    color: MyColors.black,
  );
  static const TextStyle regularDark14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w500,
    color: MyColors.black,
  );
  static const TextStyle regularDark16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: MyColors.black,
  );
  static const TextStyle regular17 = TextStyle(
    fontSize: 17,
    fontWeight: FontWeight.w500,
    color: MyColors.red,
  );
  static const TextStyle regular36 = TextStyle(
    fontSize: 36,
    fontWeight: FontWeight.w700,
    color: MyColors.black,
  );
  static const TextStyle regular30 = TextStyle(
    fontSize: 30,
    fontWeight: FontWeight.w500,
    color: MyColors.red,
  );
  static const TextStyle logintext = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: MyColors.white,
  );
  static const TextStyle registertext = TextStyle(
    fontSize: 26,
    fontWeight: FontWeight.w600,
    color: MyColors.red,
  );
  static const TextStyle registertonpressed = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: MyColors.orange,
  );
  static const TextStyle onboardingtext = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: MyColors.textblack,
  );
  static const TextStyle getstartedfirst = TextStyle(
    color: MyColors.white,
    fontSize: 34,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle getstartedsecond = TextStyle(
    color: MyColors.white,
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );
  static const TextStyle regular18 = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w600,
    color: MyColors.black,
  );
  static const TextStyle regulardark12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: MyColors.black,
  );
  static const TextStyle meduim16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: MyColors.grey,
  );
  static const TextStyle meduim12 = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w500,
    color: MyColors.green,
  );
  static TextStyle light19({Color color = MyColors.white}) =>
      TextStyle(fontSize: 19, fontWeight: FontWeight.w300, color: color);
  static TextStyle light12({Color color = MyColors.textblack}) =>
      TextStyle(fontSize: 12, fontWeight: FontWeight.w300, color: color);
  static const TextStyle light14 = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w300,
    color: MyColors.textblack,
  );
  static const TextStyle light16 = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w300,
    color: MyColors.textblack,
  );
  static TextStyle light20({Color color = MyColors.white}) =>
      TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: color);
  static TextStyle extraLight14(Color color) =>
      TextStyle(fontSize: 14, fontWeight: FontWeight.w200, color: color);
}
