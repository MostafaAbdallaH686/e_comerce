part of 'bestsellerproduct_cubit.dart';

@immutable
abstract class BestsellerproductState {}

class BestsellerproductInitial extends BestsellerproductState {}

class BestsellerproductLoading extends BestsellerproductState {}

class BestsellerproductSuccess extends BestsellerproductState {
  final BestSeller bestSeller; // ✅ استبدال BestSellerProduct بـ BestSeller

  BestsellerproductSuccess(this.bestSeller);
}

class BestsellerproductFailure extends BestsellerproductState {
  final String errMessage;

  BestsellerproductFailure({required this.errMessage});
}
