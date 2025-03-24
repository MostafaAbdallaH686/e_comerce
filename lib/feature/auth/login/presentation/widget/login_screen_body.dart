import 'dart:developer';

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
import 'package:ntigradproject/feature/auth/login/manager/login_cubit/login_cubit.dart';
import 'package:ntigradproject/feature/auth/login/manager/login_cubit/login_state.dart';
import 'package:ntigradproject/feature/home/presentation/home_view.dart';
import 'package:ntigradproject/feature/home/presentation/my_home.dart';
import 'package:ntigradproject/feature/orders/presentation/no_orders_screen.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        spacing: 23,
        children: [
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
          // top section
          //    const CustomLogAuth(),
          // center section
          Padding(
            padding: AppPadding.screenPaddingHorizonta22,
            child: BlocBuilder<LoginCubit, LoginState>(
              builder: (context, state) {
                return Form(
                  key: LoginCubit.get(context).globalKey,
                  autovalidateMode: LoginCubit.get(context).autovalidateMode,
                  child: Column(
                    spacing: 10,
                    children: [
                      DefaultTextFormFiled(
                        icons: AppIcon.email1,
                        label: AppString.email,
                        hint: AppString.email,
                        controller: LoginCubit.get(context).emailController,
                        validator: LoginCubit.get(context).emailValidator,
                      ),
                      DefaultTextFormFiled(
                        icons: AppIcon.password1,
                        label: AppString.password,
                        hint: AppString.password,
                        controller: LoginCubit.get(context).passwordController,
                        validator: LoginCubit.get(context).passwordValidator,
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
                BlocConsumer<LoginCubit, LoginState>(
                  listener: (context, state) {
                    log(state.toString());
                    if (state is LoginFailingState) {
                      AppSnakBar.showSnakBar(
                        title: "Error",
                        message: state.errMessage,
                      );
                    } else if (state is LoginSuccessState) {
                      log("Success Login");
                      AppRoute.navigateTo(TestView());
                      log("Success Login");
                    }
                  },
                  builder: (context, state) {
                    if (state is LoginLoadingState) {
                      return const CustomCircleProgressInicator();
                    }
                    return DefaultCustomButtong(
                      text: AppString.login,
                      onTap: LoginCubit.get(context).onTap,
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
