import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ntigradproject/core/dio/dio_exception.dart';
import 'package:ntigradproject/feature/home/data/models/silder/silder_model.dart';
import 'package:ntigradproject/feature/home/data/repositories/repo_slider/repo.dart';
import 'package:ntigradproject/feature/home/data/service/slider_service.dart';

class RepoSliderImpl implements SliderRepo {
  final SliderService sliderService;

  RepoSliderImpl({required this.sliderService});

  @override
  Future<Either<String, SilderModel>> getSliderData() async {
    try {
      var response = await sliderService.getSlider();
      return Right(SilderModel.fromJson(response!.data));
    } on CustomDioException catch (e) {
      return left(e.errMessage);
    } catch (e) {
      return left(e.toString());
    }
  }
}
