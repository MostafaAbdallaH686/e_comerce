import 'category.dart';

class RecommendedCategory {
  List<Category>? categories;
  bool? status;

  RecommendedCategory({this.categories, this.status});

  factory RecommendedCategory.fromJson(Map<String, dynamic> json) {
    return RecommendedCategory(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
      status: json['status'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
        'categories': categories?.map((e) => e.toJson()).toList(),
        'status': status,
      };
}
