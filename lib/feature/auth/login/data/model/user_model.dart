import 'package:ntigradproject/core/api/api_keypoint.dart';

class UserLoginModel {
  final String email;
  final String? name;
  final String? phone;

  final int id;
  final String? image;

  UserLoginModel({
    required this.email,
    required this.id,
    this.image,
    this.phone,
    this.name,
  });

  factory UserLoginModel.fromJson(Map json) {
    return UserLoginModel(
      email: json[ApiKeypoint.email],
      name: json[ApiKeypoint.name],
      phone: json[ApiKeypoint.phone],

      id: json[ApiKeypoint.id],
      image: json[ApiKeypoint.imagepath],
    );
  }

  Map toMap() {
    return {
      ApiKeypoint.name: name,
      ApiKeypoint.phone: phone,

      ApiKeypoint.email: email,
      ApiKeypoint.id: id,
      ApiKeypoint.imagepath: image,
    };
  }
}
