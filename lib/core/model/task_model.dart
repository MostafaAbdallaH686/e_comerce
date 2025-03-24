import 'package:ntigradproject/core/api/api_keypoint.dart';

class TaskModel {
  final String createAt;
  final String description;
  final String title;
  final String? imagePath;
  final int id;

  TaskModel({
    required this.createAt,
    required this.description,
    required this.title,
    required this.imagePath,
    required this.id,
  });

  factory TaskModel.fromJson(Map json) {
    return TaskModel(
      createAt: json[ApiKeypoint.createdat],
      description: json[ApiKeypoint.description],
      title: json[ApiKeypoint.title],
      imagePath: json[ApiKeypoint.imagepath],
      id: json[ApiKeypoint.id],
    );
  }
}
