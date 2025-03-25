class Product {
  int? bestSeller;
  String? description;
  int? id;
  String? imagePath;
  bool? isFavorite;
  String? name;
  int? price;
  double? rating;

  Product({
    this.bestSeller,
    this.description,
    this.id,
    this.imagePath,
    this.isFavorite,
    this.name,
    this.price,
    this.rating,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        bestSeller: json['best_seller'] as int?,
        description: json['description'] as String?,
        id: json['id'] as int?,
        imagePath: json['image_path'] as String?,
        isFavorite: json['is_favorite'] as bool?,
        name: json['name'] as String?,
        price: json['price'] as int?,
        rating: (json['rating'] as num?)?.toDouble(),
      );

  Map<String, dynamic> toJson() => {
        'best_seller': bestSeller,
        'description': description,
        'id': id,
        'image_path': imagePath,
        'is_favorite': isFavorite,
        'name': name,
        'price': price,
        'rating': rating,
      };
}
