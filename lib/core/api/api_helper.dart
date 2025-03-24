import 'package:dio/dio.dart' as dio;
import 'package:dio/dio.dart';
import 'package:ntigradproject/core/api/api_configration.dart';
import 'package:ntigradproject/core/api/api_endpoint.dart';
import 'package:ntigradproject/core/api/api_keypoint.dart';
import 'package:ntigradproject/core/api/api_response.dart';
import 'package:ntigradproject/core/dio/dio_exception.dart';
import 'package:ntigradproject/core/helper/cache_helper.dart';
import 'package:ntigradproject/core/helper/shared_preferenece_key.dart';

class ApiHelper {
  ApiHelper._();
  static final ApiHelper _instance = ApiHelper._();
  factory ApiHelper() {
    return _instance;
  }

  final objectDio = dio.Dio(ApiConfigration.option());

  Future<dynamic> get({required String endPoint, bool isAuth = false}) async {
    try {
      var response = await objectDio.get(
        endPoint,
        options: dio.Options(headers: getOption(isAuth)),
      );
      return response.data;
    } on dio.DioException catch (e) {
      throw CustomDioException(
        errMessage: ServerFailure.fromDioError(e).errorMessage,
      );
    }
  }

  Future<dynamic> post({
    required String endPoint,
    required Map<String, dynamic>? data,
    bool isAuth = false,
    bool isReferechToken = false,
  }) async {
    try {
      final formData = dio.FormData.fromMap(data ?? {});
      var response = await objectDio.post(
        endPoint,
        data: formData,
        options: dio.Options(
          headers: getOption(isAuth, isReferechToken: isReferechToken),
        ),
      );
      return response.data;
    } on dio.DioException catch (e) {
      throw CustomDioException(
        errMessage: ServerFailure.fromDioError(e).errorMessage,
      );
    }
  }

  Future<dynamic> put({
    required String endPoint,
    required Map<String, dynamic>? data,
    bool isAuth = false,
  }) async {
    try {
      final formData = dio.FormData.fromMap(data ?? {});
      var response = await objectDio.put(
        endPoint,
        data: formData,
        options: dio.Options(headers: getOption(isAuth)),
      );
      return response.data;
    } on dio.DioException catch (e) {
      throw CustomDioException(
        errMessage: ServerFailure.fromDioError(e).errorMessage,
      );
    }
  }

  Future<dynamic> patch(String endPoint) async {
    var response = await objectDio.patch(endPoint);
    return response.data;
  }

  Future<dynamic> delete(String endPoint) async {
    var response = await objectDio.delete(endPoint);
    return response.data;
  }

  Map<String, dynamic>? getOption(bool isAuth, {bool isReferechToken = false}) {
    Helper cacheHelpe = Helper();
    if (isAuth) {
      return {
        ApiKeypoint.authorization:
            cacheHelpe.getDataString(key: SharedPrefereneceKey.accesstoken) !=
                    null
                ? "Bearer ${cacheHelpe.getDataString(key: SharedPrefereneceKey.accesstoken)}"
                : null,
      };
    }
    if (isReferechToken) {
      return {
        ApiKeypoint.authorization:
            cacheHelpe.getDataString(key: SharedPrefereneceKey.refreshtoken) !=
                    null
                ? "Bearer ${cacheHelpe.getDataString(key: SharedPrefereneceKey.refreshtoken)}"
                : null,
      };
    } else {
      return null;
    }
  }
}

class ApiHelper1 {
  static final ApiHelper1 _singleton = ApiHelper1._internal();

  factory ApiHelper1() => _singleton;

  ApiHelper1._internal();

  Dio dio = Dio(
    BaseOptions(
      baseUrl: ApiBaseUrl.baseUrl,
      connectTimeout: Duration(seconds: 10),
      receiveTimeout: Duration(seconds: 10),
    ),
  );

  Future<ApiResponse> getRequest({
    required String url,
    Map<String, dynamic>? data,
    bool isFormdata = true,
    bool isAuthorized = true,
  }) async {
    try {
      var response = await dio.get(
        url,
        data: isFormdata ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isAuthorized)
              "Authorization":
                  "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc0Mjc1NTU4NCwianRpIjoiMjZjMjUxMjMtMTlmMS00MTI3LTgxMmUtMTM2OTU2OGMwOWIzIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MiwibmJmIjoxNzQyNzU1NTg0LCJjc3JmIjoiYmJkM2JlZGItZTIyNy00OTA5LWJkNTQtZTMwNTI5ZDZkNjhjIiwiZXhwIjoxNzQyNzU2NDg0fQ.4EvOG9RK3FTk-sYbZlzfIpyIFC4WH07MYvoT6bvtfSk",
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e as DioException);
    }
  }

  Future<ApiResponse> postRequest({
    required String url,
    Map<String, dynamic>? data,
    bool isFormdata = true,
    bool isAuthorized = true,
  }) async {
    try {
      var response = await dio.post(
        url,
        data: isFormdata ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isAuthorized)
              "Authorization": "Bearer ${ApiKeypoint.accesstoken}",
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e as DioException);
    }
  }

  Future<ApiResponse> putRequest({
    required String url,
    Map<String, dynamic>? data,
    bool isFormdata = true,
    bool isAuthorized = true,
  }) async {
    try {
      var response = await dio.put(
        url,
        data: isFormdata ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isAuthorized)
              "Authorization":
                  "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJmcmVzaCI6ZmFsc2UsImlhdCI6MTc0Mjc2MDg2NiwianRpIjoiNjNhNzdiMWMtODMyMC00MTk5LThmODgtOGNjODkwZjViZTQzIiwidHlwZSI6ImFjY2VzcyIsInN1YiI6MiwibmJmIjoxNzQyNzYwODY2LCJjc3JmIjoiMDg4NGJlN2UtOTkwYS00YjcxLThjZTItM2UzZWNmNmFhZWRlIiwiZXhwIjoxNzQyNzYxNzY2fQ.kl1KNgN5JpwVilADoYu2sQQn5gJMepnpFcWsORNfPSA",
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e as DioException);
    }
  }

  Future<ApiResponse> deleteRequest({
    required String url,
    Map<String, dynamic>? data,
    bool isFormdata = true,
    bool isAuthorized = true,
  }) async {
    try {
      var response = await dio.delete(
        url,
        data: isFormdata ? FormData.fromMap(data ?? {}) : data,
        options: Options(
          headers: {
            if (isAuthorized)
              "Authorization": "Bearer ${ApiKeypoint.accesstoken}",
          },
        ),
      );
      return ApiResponse.fromResponse(response);
    } catch (e) {
      return ApiResponse.fromError(e as DioException);
    }
  }
}
