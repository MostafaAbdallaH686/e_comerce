import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntigradproject/core/function/app_route.dart';
import 'package:ntigradproject/core/function/app_snak_bar.dart';
import 'package:ntigradproject/core/localization/app_string_keys.dart';
import 'package:ntigradproject/core/theme/app_text_style.dart';
import 'package:ntigradproject/core/utils/app_icon.dart';
import 'package:ntigradproject/core/utils/app_padding.dart';
import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/core/widget/custom_circle_progress_inicator.dart';
import 'package:ntigradproject/core/widget/default_custom_buttong.dart';
import 'package:ntigradproject/core/widget/default_text_form_filed.dart';
import 'package:ntigradproject/feature/auth/login/presentation/login_screen.dart';
import 'package:ntigradproject/feature/auth/register/manager/register_cubit/register_cubit.dart';
import 'package:ntigradproject/feature/auth/register/manager/register_cubit/register_state.dart';
import 'package:ntigradproject/feature/auth/share_widget/custom_botton_section_text.dart';

class RegisterScreenBody extends StatelessWidget {
  const RegisterScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 23,
        children: [
          // SizedBox(height: AppHeight.h15),
          Padding(
            padding: AppPadding.screenPaddingHorizonta22,

            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  AppStringKeys.createaccount,
                  style: AppTextStyle.regular36,
                ),
              ],
            ),
          ),
          // center section
          Padding(
            padding: AppPadding.screenPaddingHorizonta22,
            child: BlocBuilder<RegisterCubit, RegisterState>(
              builder: (context, state) {
                return Form(
                  key: RegisterCubit.get(context).globalKey,
                  autovalidateMode: RegisterCubit.get(context).autovalidateMode,
                  child: Column(
                    spacing: 10,
                    children: [
                      DefaultTextFormFiled(
                        controller: RegisterCubit.get(context).nameController,
                        icons: AppIcon.username1,
                        label: AppString.userName,
                        hint: AppString.userName,
                        validator: RegisterCubit.get(context).nameValidator,
                      ),
                      DefaultTextFormFiled(
                        controller: RegisterCubit.get(context).phoneController,
                        icons: AppIcon.phone1,
                        label: AppString.phone,
                        hint: AppString.phone,
                        validator: RegisterCubit.get(context).phoneValidator,
                      ),
                      DefaultTextFormFiled(
                        icons: AppIcon.email1,
                        label: AppString.email,
                        hint: AppString.email,
                        controller: RegisterCubit.get(context).emailController,
                        validator: RegisterCubit.get(context).emailValidator,
                      ),
                      DefaultTextFormFiled(
                        icons: AppIcon.password1,
                        label: AppString.password,
                        hint: AppString.password,
                        controller:
                            RegisterCubit.get(context).passwordController,
                        validator: RegisterCubit.get(context).passwordValidator,
                      ),
                      DefaultTextFormFiled(
                        icons: AppIcon.password1,
                        label: AppString.confirmPassword,
                        hint: AppString.confirmPassword,
                        controller:
                            RegisterCubit.get(
                              context,
                            ).confirmPasswordController,
                        validator:
                            RegisterCubit.get(context).confirmPasswordValidator,
                      ),
                      CustomBottonSectionText(
                        startText: AppStringKeys.registerHaveAreayAccount,
                        buttonText: AppStringKeys.registerHaveAccount,
                        onPressed: () {
                          AppRoute.navigateBack();
                        },
                        endText: AppStringKeys.registerHaveAreayAccountafter,
                        end2Text: AppStringKeys.registerHaveAreayAccountafter2,
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          // button section
          Padding(
            padding: AppPadding.screenPaddingHorizonta22,
            child: Column(
              spacing: 32,
              children: [
                BlocConsumer<RegisterCubit, RegisterState>(
                  listener: (context, state) {
                    if (state is RegisterFailingState) {
                      AppSnakBar.showSnakBar(
                        title: "Error",
                        message: state.errMessage,
                      );
                    } else if (state is RegisterSuccessState) {
                      AppRoute.navigateTo(LoginScreen());
                    }
                  },
                  builder: (context, state) {
                    if (state is RegisterLoadingState) {
                      return const CustomCircleProgressInicator();
                    }
                    return DefaultCustomButtong(
                      text: AppString.register,
                      onTap: RegisterCubit.get(context).onTap,
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
