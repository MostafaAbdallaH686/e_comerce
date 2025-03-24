import 'dart:io';

import 'package:dio/dio.dart';
import 'package:ntigradproject/core/api/api_keypoint.dart';

class UserModel {
  final String? userName;
  final String password;
  final String email;
  final String? phone;

  final File? image;

  UserModel({
    required this.email,
    required this.password,
    this.phone,
    this.userName,
    this.image,
  });

  Future<Map<String, dynamic>> toMap() async {
    return {
      ApiKeypoint.name: userName,
      ApiKeypoint.password: password,
      ApiKeypoint.image: image,
      ApiKeypoint.email: email,
      ApiKeypoint.phone: phone,
    };
  }
}
