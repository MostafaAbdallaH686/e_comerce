import 'dart:developer';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ntigradproject/core/api/api_endpoint.dart';
import 'package:ntigradproject/core/api/api_helper.dart';
import 'package:ntigradproject/core/api/api_keypoint.dart';
import 'package:ntigradproject/core/dio/dio_exception.dart';
import 'package:ntigradproject/core/helper/cache_helper.dart';
import 'package:ntigradproject/core/helper/shared_preferenece_key.dart';
import 'package:ntigradproject/feature/auth/login/data/model/user_model.dart';

class UpdateProfileRepo {
  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, void>> update({
    required String email,
    required String name,
    required String phone,

    required File? image,
  }) async {
    try {
      log(phone);

      log(name);
      log(email);

      log(image?.path ?? "Path not Valid");
      var path =
          image != null
              ? await MultipartFile.fromFile(
                image.path,
                filename: image.path.split('/').last,
              )
              : null;
      log(path?.toString() ?? "");
      Map<String, dynamic> data = {};
      if (path == null) {
        data = {
          // ApiKeypoint.email: email,
          ApiKeypoint.name: name,
          ApiKeypoint.phone: phone,
        };
      } else {
        data = {
          // ApiKeypoint.email: email,
          ApiKeypoint.phone: phone,

          ApiKeypoint.name: name,
          ApiKeypoint.image: path,
        };
      }
      log(data.toString());
      await apiHelper.put(
        endPoint: ApiEndpoint.updateprofile,
        data: data,
        isAuth: true,
      );
      log("Update Sucessfully");
      return right(0);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      log(e.toString());
      return left("oops! there was error");
    }
  }

  Helper cacheHelper = Helper();
  Future<Either<String, void>> getUserData() async {
    try {
      var response = await apiHelper.get(
        endPoint: ApiEndpoint.getuserdata,
        isAuth: true,
      );
      UserLoginModel user = UserLoginModel.fromJson(response[ApiKeypoint.user]);

      log(" Get Data Reponse = ${response}");
      log(" Get Data Reponse = ${user.toMap()}");

      await cacheHelper.saveData(
        key: SharedPrefereneceKey.name,
        value: user.name,
      );
      await cacheHelper.saveData(
        key: SharedPrefereneceKey.name,
        value: user.name,
      );
      await cacheHelper.saveData(
        key: SharedPrefereneceKey.imagepath,
        value: user.image,
      );
      await cacheHelper.saveData(
        key: SharedPrefereneceKey.phone,
        value: user.image,
      );
      return right(0);
    } on CustomDioException catch (e) {
      cacheHelper.saveData(key: SharedPrefereneceKey.isLogin, value: false);
      return left(e.errMessage);
    } catch (e) {
      cacheHelper.saveData(key: SharedPrefereneceKey.isLogin, value: false);
      return left("oops! there was an error");
    }
  }
}
