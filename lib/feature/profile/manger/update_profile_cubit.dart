import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ntigradproject/core/function/app_route.dart';
import 'package:ntigradproject/core/function/app_snak_bar.dart';
import 'package:ntigradproject/core/helper/cache_helper.dart';
import 'package:ntigradproject/core/helper/shared_preferenece_key.dart';
import 'package:ntigradproject/core/utils/app_string.dart';
import 'package:ntigradproject/core/utils/app_validator.dart';
import 'package:ntigradproject/feature/profile/data/update_profile_repo.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  UpdateProfileCubit() : super(UpdateProfileInitial()) {
    Helper cacheHelper = Helper();

    String? username = cacheHelper.getDataString(
      key: SharedPrefereneceKey.name,
    );
    String? email = cacheHelper.getDataString(key: SharedPrefereneceKey.email);
    usernameController = TextEditingController(text: username);
    String? phone = cacheHelper.getDataString(key: SharedPrefereneceKey.phone);
    emailController = TextEditingController(text: email);
    phoneController = TextEditingController(text: phone);
  }
  static UpdateProfileCubit get(context) => BlocProvider.of(context);

  AppValidator validator = AppValidator();

  GlobalKey<FormState> globalKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  late TextEditingController phoneController;

  late TextEditingController usernameController;
  late TextEditingController emailController;

  XFile? image;
  final ImagePicker _imagePicker = ImagePicker();

  // read Image

  void _readImageFromGallery() async {
    image = await _imagePicker.pickImage(source: ImageSource.gallery);
    emit(UpdateProfilePickImage());
  }

  void _readImageFromCamera() async {
    image = await _imagePicker.pickImage(source: ImageSource.camera);
    emit(UpdateProfilePickImage());
  }

  void selectImage() async {
    await Get.dialog(
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              _readImageFromCamera();
              AppRoute.navigateBack();
            },
            icon: Icon(Icons.camera),
          ),
          IconButton(
            onPressed: () {
              _readImageFromGallery();
              AppRoute.navigateBack();
            },
            icon: Icon(Icons.photo_library),
          ),
        ],
      ),
    );
  }

  UpdateProfileRepo repo = UpdateProfileRepo();
  void onTap() async {
    emit(UpdateProfileLoading());

    if (globalKey.currentState!.validate()) {
      var response = await repo.update(
        email: emailController.text,
        name: usernameController.text,
        phone: phoneController.text,
        image: image == null ? null : File(image!.path),
      );
      response.fold((e) => emit(UpdateProfileFailing(errMessage: e)), (
        r,
      ) async {
        await updateData();
        emit(UpdateProfileSuccess());
      });
    } else {
      autovalidateMode = AutovalidateMode.always;
      emit(UpdateProfileNotValidate());
    }
  }

  Future<void> updateData() async {
    var response = await repo.getUserData();
    response.fold(
      (error) {
        AppSnakBar.showSnakBar2(
          title: AppString.error,
          message: "there was an error login again",
        );
      },
      (r) {
        return;
      },
    );
  }
}
