import 'package:dartz/dartz.dart';
import 'package:ntigradproject/feature/home/data/models/best_seller/best_seller.dart';

abstract class BestSellerProductRepo {
  Future<Either<String, BestSeller>> getHomeData();
}
