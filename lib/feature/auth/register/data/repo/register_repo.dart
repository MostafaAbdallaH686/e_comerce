import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:ntigradproject/core/api/api_endpoint.dart';
import 'package:ntigradproject/core/api/api_helper.dart';
import 'package:ntigradproject/core/api/api_keypoint.dart';
import 'package:ntigradproject/core/dio/dio_exception.dart';
import 'package:ntigradproject/core/model/user_model.dart';

class RegisterRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, String>> register({
    required String email,
    required String phone,
    required String name,

    required String password,
    //  File? image,
  }) async {
    try {
      //  log(image?.path ?? "Image Null");
      UserModel user = UserModel(
        phone: phone,
        email: email,
        password: password,
        //  image: image,
        userName: name,
      );
      var data = await user.toMap();
      //log(user.image?.path ?? "Image Null");
      log(data.toString());

      var response =
          await apiHelper.post(endPoint: ApiEndpoint.register, data: data)
              as Map;
      String message = response[ApiKeypoint.message];
      return right(message);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      return left(e.toString());
    }
  }
}
