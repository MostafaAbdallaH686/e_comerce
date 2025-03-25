import 'best_seller_product.dart';

class BestSeller {
  List<BestSellerProduct>? bestSellerProducts;
  bool? status;

  BestSeller({this.bestSellerProducts, this.status});

  factory BestSeller.fromJson(Map<String, dynamic> json) => BestSeller(
        bestSellerProducts: (json['best_seller_products'] as List<dynamic>?)
            ?.map((e) => BestSellerProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'best_seller_products':
            bestSellerProducts?.map((e) => e.toJson()).toList(),
        'status': status,
      };
}
