// import 'dart:async';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class DioWrapper {
//   static final DioWrapper _instance = DioWrapper._internal();
//   factory DioWrapper() => _instance;

//   Dio get dio => _dio;
//   late final Dio _dio;
//   final int _timeOut = 120 * 1000;
//   bool _isRefreshing = false;
//   final List<void Function(String)> _tokenQueue = [];

//   /// 🔹 **تهيئة Dio وإضافة Interceptors**
//   DioWrapper._internal() {
//     _dio = Dio(BaseOptions(
//       baseUrl: 'https://nti-ecommerce-api-production.up.railway.app/api/',
//       connectTimeout: Duration(milliseconds: _timeOut),
//       receiveTimeout: Duration(milliseconds: _timeOut),
//       headers: {"Accept": "application/json"},
//     ));

//     _dio.interceptors.add(InterceptorsWrapper(
//       onRequest: _onRequest,
//       onResponse: _onResponse,
//       onError: _onError,
//     ));
//   }

//   Future<void> initialize() async {
//     //var box = await Hive.openBox<String>('authBox');
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     String? token = box.get('token') ?? prefs.getString('accessToken');
//     String? refreshToken =
//         box.get('refresh_token') ?? prefs.getString('refreshToken');

//     if (token != null) {
//       setToken(token);
//     }
//     print("🔑 Access Token: $token");
//     print("🔄 Refresh Token: $refreshToken");
//   }

//   void _onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     print("🚀 Requesting: ${options.method} ${options.uri}");
//     print("📦 Data Sent: ${options.data}");
//     handler.next(options);
//   }

//   void _onResponse(Response response, ResponseInterceptorHandler handler) {
//     print("✅ Response: ${response.statusCode}");
//     handler.next(response);
//   }

//   void _onError(DioException error, ErrorInterceptorHandler handler) async {
//     print("❌ Dio Error: ${error.response?.statusCode}");

//     if (error.response?.statusCode == 401) {
//       bool refreshed = (await handleTokenRefresh()) != null;
//       if (refreshed) {
//         final retryResponse = await _dio.fetch(error.requestOptions);
//         return handler.resolve(retryResponse);
//       }
//     }
//     handler.next(error);
//   }

//   Future<String?> handleTokenRefresh() async {
//     if (_isRefreshing) {
//       final completer = Completer<String?>();
//       _tokenQueue.add((newToken) => completer.complete(newToken));
//       return completer.future;
//     }

//     _isRefreshing = true;
//    // var box = await Hive.openBox<String>('authBox');
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     String? refreshToken =
//         box.get('refresh_token') ?? prefs.getString('refreshToken');
//     if (refreshToken == null) {
//       _isRefreshing = false;
//       return null;
//     }

//     try {
//       final response = await _dio.post(
//         'refresh_token',
//         data: {"refresh_token": refreshToken},
//       );

//       if (response.statusCode == 200) {
//         String newAccessToken = response.data['accessToken'];
//         await box.put('token', newAccessToken);
//         await prefs.setString('accessToken', newAccessToken);
//         setToken(newAccessToken);
//         return newAccessToken;
//       }
//     } catch (e) {
//       print("⚠️ Error refreshing token: $e");
//     } finally {
//       _isRefreshing = false;
//     }
//     return null;
//   }

//   void setToken(String? token) {
//     _dio.options.headers["Authorization"] =
//         token != null ? "Bearer $token" : null;
//   }

//   Future<Response?> postRequest(String endpoint,
//       {Map<String, dynamic>? data, bool requiresAuth = false}) async {
//     return _handleRequest(() async {
//       return await _dio.post(
//         endpoint,
//         data: FormData.fromMap(data ?? {}),
//         options: Options(headers: await _getHeaders(requiresAuth)),
//       );
//     });
//   }

//   Future<Response?> getRequest(String endpoint,
//       {bool requiresAuth = false}) async {
//     return _handleRequest(() async {
//       return await _dio.get(
//         endpoint,
//         options: Options(headers: await _getHeaders(requiresAuth)),
//       );
//     });
//   }

//   Future<Response?> deleteRequest(String endpoint,
//       {bool requiresAuth = false}) async {
//     return _handleRequest(() async {
//       return await _dio.delete(
//         endpoint,
//         options: Options(headers: await _getHeaders(requiresAuth)),
//       );
//     });
//   }

//   Future<Response?> _handleRequest(Future<Response> Function() request) async {
//     try {
//       Response response = await request();
//       return response;
//     } on DioException catch (e) {
//       print("⚠️ DioException: ${e.response?.statusCode} - ${e.message}");
//       return e.response;
//     } catch (e) {
//       print("⚠️ Unexpected Error: $e");
//       return null;
//     }
//   }

//   Future<Map<String, String>> _getHeaders(bool requiresAuth) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     var token = prefs.getString('accessToken');
//     var headers = {"Accept": "application/json"};
//     if (requiresAuth && token != null) {
//       headers["Authorization"] = "Bearer $token";
//     }
//     return headers;
//   }
// }
