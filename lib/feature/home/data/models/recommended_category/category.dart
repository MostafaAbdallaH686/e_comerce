import 'product.dart';

class Category {
  String? description;
  int? id;
  String? imagePath;
  List<Product>? products;
  String? title;

  Category({
    this.description,
    this.id,
    this.imagePath,
    this.products,
    this.title,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
        description: json['description'] as String?,
        id: json['id'] as int?,
        imagePath: json['image_path'] as String?,
        products: (json['products'] as List<dynamic>?)
            ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
            .toList(),
        title: json['title'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'description': description,
        'id': id,
        'image_path': imagePath,
        'products': products?.map((e) => e.toJson()).toList(),
        'title': title,
      };
}
