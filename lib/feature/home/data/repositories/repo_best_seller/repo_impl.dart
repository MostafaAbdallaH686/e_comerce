import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ntigradproject/core/dio/dio_exception.dart';
import 'package:ntigradproject/feature/home/data/models/best_seller/best_seller.dart';
import 'package:ntigradproject/feature/home/data/repositories/repo_best_seller/repo.dart';
import 'package:ntigradproject/feature/home/data/service/best_seller_service.dart';

class RepoImpl implements BestSellerProductRepo {
  final BestSellerService bestSellerService;

  RepoImpl({required this.bestSellerService});

  @override
  Future<Either<String, BestSeller>> getHomeData() async {
    try {
      var response = await bestSellerService.getBestSellers();
      return Right(
        BestSeller.fromJson(response!.data),
      ); // ✅ إرجاع BestSeller بالكامل
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      return left(e.toString());
    }
  }
}
