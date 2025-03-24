import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:ntigradproject/core/helper/cache_helper.dart';
import 'package:ntigradproject/feature/auth/login/presentation/login_screen.dart';
import 'package:ntigradproject/feature/auth/register/presentation/register_screen.dart';
import 'package:ntigradproject/feature/home/presentation/my_home.dart';
import 'package:ntigradproject/feature/profile/manger/update_profile_cubit.dart';
import 'package:ntigradproject/feature/start/view/get-start_view.dart';
import 'package:ntigradproject/feature/start/view/splash_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Helper cacheHelper = Helper();
  await cacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: GetMaterialApp(
        title: 'Shop',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        ),
        home: const SplashView(),
      ),
    );
  }
}
