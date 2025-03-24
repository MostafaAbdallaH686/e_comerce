import 'package:ntigradproject/core/api/api_endpoint.dart';
import 'package:ntigradproject/core/api/api_helper.dart';
import 'package:ntigradproject/core/api/api_keypoint.dart';
import 'package:ntigradproject/core/dio/dio_exception.dart';
import 'package:ntigradproject/core/function/app_route.dart';
import 'package:ntigradproject/core/helper/cache_helper.dart';
import 'package:ntigradproject/core/helper/shared_preferenece_key.dart';
import 'package:ntigradproject/feature/auth/login/presentation/login_screen.dart';

void handleExpairedAcessToken() async {
  ApiHelper apiHelper = ApiHelper();
  Helper cacheHelper = Helper();
  try {
    var respose = await apiHelper.post(
      endPoint: ApiEndpoint.refreshtoken,
      data: null,
      isReferechToken: true,
    );
    cacheHelper.saveData(
      key: SharedPrefereneceKey.accesstoken,
      value: respose[ApiKeypoint.accesstoken],
    );
  } on CustomDioException catch (e) {
    return;
  } catch (e) {
    return;
  }
}

void handleExpairedRefrechToken() {
  Helper cacheHelper = Helper();

  cacheHelper.saveData(key: SharedPrefereneceKey.isLogin, value: false);
  AppRoute.navigateTo(LoginScreen());
}
