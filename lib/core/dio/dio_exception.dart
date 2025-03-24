import 'package:dio/dio.dart';
import 'package:ntigradproject/core/api/handle_expaired_access_token_and_refresh_token.dart';

class CustomDioException implements Exception {
  final String errMessage;

  CustomDioException({required this.errMessage});
}

abstract class Failures {
  final String errorMessage;

  const Failures(this.errorMessage);
}

class ServerFailure extends Failures {
  ServerFailure(super.errorMessage);

  factory ServerFailure.fromDioError(DioException dioError) {
    switch (dioError.type) {
      case DioExceptionType.connectionTimeout:
        return ServerFailure('Connection timeout with ApiServer');

      case DioExceptionType.sendTimeout:
        return ServerFailure('Send timeout with ApiServer');
      case DioExceptionType.receiveTimeout:
        return ServerFailure('Receive timeout with ApiServer');
      case DioExceptionType.badCertificate:
        return ServerFailure('Bad certificate with ApiServer');
      case DioExceptionType.badResponse:
        return ServerFailure.fromResponse(
          dioError.response!.statusCode!,
          dioError.response!.data,
        );
      case DioExceptionType.cancel:
        return ServerFailure('Cancel request');
      case DioExceptionType.connectionError:
        return ServerFailure('No Internet Connection');
      case DioExceptionType.unknown:
        if (dioError.message?.contains('SocketException') ?? false) {
          return ServerFailure('No Internet Connection');
        }
        return ServerFailure('Unexpected Error , please try again');
      default:
        return ServerFailure('Oops there was an error , please try again');
    }
  }

  factory ServerFailure.fromResponse(int statusCode, dynamic response) {
    if (statusCode == 400 || statusCode == 401 || statusCode == 403) {
      if (response["message"] == "Token has expired.") {
        handleExpairedAcessToken();
      }
      return ServerFailure(response["message"]);
    } else if (statusCode == 404) {
      return ServerFailure('Your request not found , please try later');
    } else if (statusCode == 500) {
      return ServerFailure('Internet server error , please try later');
    } else {
      return ServerFailure('Oops there was an error , please try again');
    }
  }
}
