import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/theme/app_text_style.dart';
import 'package:ntigradproject/core/utils/app_radius.dart';

class DefaultTextFormFiled extends StatelessWidget {
  const DefaultTextFormFiled({
    super.key,
    required this.label,
    required this.hint,
    this.validator,
    this.controller,
    required this.icons,
  });
  final String label;
  final String hint;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String icons;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorHeight: 13,
      cursorColor: MyColors.black,
      cursorWidth: 1,
      controller: controller,
      validator: validator,
      style: AppTextStyle.extraLight14(MyColors.black),
      decoration: InputDecoration(
        prefixIcon: SvgPicture.asset(icons, fit: BoxFit.scaleDown),
        hintText: hint,
        labelText: label,
        fillColor: MyColors.textformfieldcolor,
        filled: true,
        labelStyle: AppTextStyle.regular12,
        hintStyle: AppTextStyle.regular12,
        border: outlineInputBorder(),
        disabledBorder: outlineInputBorder(),
        enabledBorder: outlineInputBorder(),
        focusedBorder: outlineInputBorder(),
        errorBorder: outlineInputBorder(),
        focusedErrorBorder: outlineInputBorder(),
      ),
    );
  }

  OutlineInputBorder outlineInputBorder() => OutlineInputBorder(
    borderSide: BorderSide(color: MyColors.greyBorder),
    borderRadius: AppRadius.buttonRaduis,
  );
}
