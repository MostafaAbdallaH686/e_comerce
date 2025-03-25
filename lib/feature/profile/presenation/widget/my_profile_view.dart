import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:ntigradproject/core/function/app_route.dart';
import 'package:ntigradproject/core/function/app_snak_bar.dart';
import 'package:ntigradproject/core/helper/cache_helper.dart';
import 'package:ntigradproject/core/helper/shared_preferenece_key.dart';
import 'package:ntigradproject/core/theme/app_colors.dart';
import 'package:ntigradproject/core/utils/app_icon.dart';
import 'package:ntigradproject/core/utils/app_image.dart';
import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/core/widget/custom_circle_progress_inicator.dart';
import 'package:ntigradproject/core/widget/default_text_form_filed.dart';
import 'package:ntigradproject/feature/profile/manger/update_profile_cubit.dart';
import 'package:ntigradproject/feature/profile/presenation/widget/main_profile.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(),
      child: Scaffold(
        backgroundColor: MyColors.white,

        appBar: AppBar(
          backgroundColor: MyColors.white,
          centerTitle: true,
          title: const Text(AppString.profile),
          leading: Icon(Icons.arrow_back_ios),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              SizedBox(
                width: 120,
                child: Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage(AppImage.profile),
                        ),
                      ),

                      Align(
                        alignment: AlignmentDirectional.bottomEnd,
                        child: CircleAvatar(
                          radius: 18,
                          backgroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.blue,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 66),
              BlocBuilder<UpdateProfileCubit, UpdateProfileState>(
                builder: (context, state) {
                  return Form(
                    key: UpdateProfileCubit.get(context).globalKey,
                    autovalidateMode:
                        UpdateProfileCubit.get(context).autovalidateMode,
                    child: Column(
                      children: [
                        DefaultTextFormFiled(
                          label: AppString.fullname,
                          icons: AppIcon.user,
                          hint: 'fullname',
                          controller:
                              UpdateProfileCubit.get(
                                context,
                              ).usernameController,
                          validator:
                              UpdateProfileCubit.get(
                                context,
                              ).validator.nameValidator,
                        ),

                        SizedBox(height: 10),
                        DefaultTextFormFiled(
                          validator: (String? text) {
                            String error;
                            if (text != null) {
                              if (text.isNotEmpty) {
                                final RegExp phoneRegex = RegExp(
                                  r'^(010|011|012|015)[0-9]{8}$',
                                );
                                if (phoneRegex.hasMatch(text)) {
                                  return null;
                                } else {
                                  error = 'Invalid phone number.';
                                }
                              } else {
                                error = ' enter phone number ';
                              }
                            } else {
                              error = '  you must assighn phone number ';
                            }
                            return error;
                          },
                          controller:
                              UpdateProfileCubit.get(context).phoneController,

                          label: AppString.phone,
                          icons: AppIcon.call,
                          hint: 'phone',
                        ),
                      ],
                    ),
                  );
                },
              ),

              SizedBox(height: 70),
              Container(
                width: double.infinity,
                height: 55,
                margin: EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  color: MyColors.red,
                  borderRadius: BorderRadius.circular(4),
                ),
                child: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
                  listener: (context, state) {
                    if (state is UpdateProfileFailing) {
                      AppSnakBar.showSnakBar(
                        title: AppString.error,
                        message: state.errMessage,
                      );
                    } else if (state is UpdateProfileSuccess) {
                      AppSnakBar.showSnakBar2(
                        title: AppString.success,
                        message: AppString.updateprofilesuccess,
                      );
                      AppRoute.navigateTo(MainProfile());
                    }
                  },
                  builder: (context, state) {
                    if (state is UpdateProfileLoading) {
                      return CustomCircleProgressInicator();
                    }
                    return TextButton(
                      onPressed: () => UpdateProfileCubit.get(context).onTap,
                      child: Text(
                        AppString.save,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: MyColors.white,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Widget getImage() {
  Helper cacheHelper = Helper();
  String? image = cacheHelper.getDataString(
    key: SharedPrefereneceKey.imagepath,
  );
  if (image == null) {
    return Image.asset(AppImage.authLogo);
  } else {
    return Image.network(image, fit: BoxFit.cover);
  }
}
