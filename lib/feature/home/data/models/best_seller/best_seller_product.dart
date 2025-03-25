import 'category.dart';

class BestSellerProduct {
  int? bestSeller;
  Category? category;
  String? description;
  int? id;
  String? imagePath;
  bool? isFavorite;
  String? name;
  double? price;
  double? rating;

  BestSellerProduct({
    this.bestSeller,
    this.category,
    this.description,
    this.id,
    this.imagePath,
    this.isFavorite,
    this.name,
    this.price,
    this.rating,
  });

  factory BestSellerProduct.fromJson(Map<String, dynamic> json) {
    return BestSellerProduct(
      bestSeller: json['best_seller'] as int?,
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      description: json['description'] as String?,
      id: json['id'] as int?,
      imagePath: json['image_path'] as String?,
      isFavorite: json['is_favorite'] as bool?,
      name: json['name'] as String?,
      price: json['price'] as double?,
      rating: (json['rating'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() => {
        'best_seller': bestSeller,
        'category': category?.toJson(),
        'description': description,
        'id': id,
        'image_path': imagePath,
        'is_favorite': isFavorite,
        'name': name,
        'price': price,
        'rating': rating,
      };
}
