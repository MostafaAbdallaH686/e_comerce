import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ntigradproject/core/function/app_route.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/utils/app_icon.dart';
import 'package:ntigradproject/core/widget/custom_app_bar.dart';
import 'package:ntigradproject/core/widget/custom_arrow_back.dart';
import 'package:ntigradproject/feature/auth/register/manager/register_cubit/register_cubit.dart';
import 'package:ntigradproject/feature/auth/register/presentation/widget/register_screen_body.dart';
import 'package:ntigradproject/feature/start/view/get-start_view.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterCubit(),
      child: Scaffold(
        backgroundColor: MyColors.white,
        appBar: AppBar(
          backgroundColor: MyColors.white,
          centerTitle: true,
          leading: CustomArrowBack(onTap: AppRoute.navigateBack),
        ),
        body: RegisterScreenBody(),
      ),
    );
  }
}
