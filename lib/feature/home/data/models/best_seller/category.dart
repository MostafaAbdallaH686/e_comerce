class Category {
  String? description;
  int? id;
  String? imagePath;
  String? title;

  Category({this.description, this.id, this.imagePath, this.title});

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        description: json['description'] as String?,
        id: json['id'] as int?,
        imagePath: json['image_path'] as String?,
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'id': id,
        'image_path': imagePath,
        'title': title,
      };
}
