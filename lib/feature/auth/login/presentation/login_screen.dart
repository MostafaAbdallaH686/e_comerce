import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ntigradproject/core/function/app_route.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/widget/custom_arrow_back.dart';
import 'package:ntigradproject/feature/auth/login/manager/login_cubit/login_cubit.dart';
import 'package:ntigradproject/feature/auth/login/presentation/widget/login_screen_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginCubit(),
      child: Scaffold(
        backgroundColor: MyColors.white,

        appBar: AppBar(
          backgroundColor: MyColors.white,
          centerTitle: true,
          leading: CustomArrowBack(onTap: AppRoute.navigateBack),
        ),
        body: LoginScreenBody(),
      ),
    );
  }
}
