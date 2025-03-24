import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:ntigradproject/core/api/api_endpoint.dart';
import 'package:ntigradproject/core/api/api_helper.dart';
import 'package:ntigradproject/core/dio/dio_exception.dart';
import 'package:ntigradproject/core/helper/cache_helper.dart';
import 'package:ntigradproject/core/helper/shared_preferenece_key.dart';
import 'package:ntigradproject/core/model/user_model.dart';
import 'package:ntigradproject/core/shared/user_service.dart';
import 'package:ntigradproject/feature/auth/login/data/model/login_model.dart';

class LoginRepo {
  UserService userService = UserService();

  ApiHelper apiHelper = ApiHelper();

  Future<Either<String, LoginModel>> login({
    //  String? name,
    required String password,
    required String email,
  }) async {
    try {
      Helper cacheHelper = Helper();
      UserModel userModel = UserModel(
        email: email,
        //  userName: name,
        password: password,
      );
      var data = await userModel.toMap();
      var response = await apiHelper.post(
        endPoint: ApiEndpoint.login,
        data: data,
      );
      LoginModel loginModel = LoginModel.fromJson(response);

      cacheHelper.saveData(key: SharedPrefereneceKey.isLogin, value: true);
      cacheHelper.saveData(
        key: SharedPrefereneceKey.accesstoken,
        value: loginModel.accesstoken,
      );
      cacheHelper.saveData(
        key: SharedPrefereneceKey.refreshtoken,
        value: loginModel.refreshtoken,
      );
      cacheHelper.saveData(
        key: SharedPrefereneceKey.email,
        value: loginModel.user.email,
      );
      cacheHelper.saveData(
        key: SharedPrefereneceKey.name,
        value: loginModel.user.name,
      );
      // log(loginModel.user.image ?? "Null Image Login");
      // if (loginModel.user.image != null) {
      //   cacheHelper.saveData(
      //     key: SharedPrefereneceKey.imagepath,
      //     value: loginModel.user.image,
      //   );
      // }

      userService.loginModel = loginModel;

      return right(loginModel);
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      return left(e.toString());
    }

    // try {
    //   if (userService.user == null) {
    //     throw "the is no account ! please register !";
    //   } else if (userService.user!.userName != name ||
    //       userService.user!.password != password) {
    //     throw "user name or password is wrong";
    //   }
    //   return right(true);
    // } catch (e) {
    //   return left(e.toString());
    // }
  }
}
