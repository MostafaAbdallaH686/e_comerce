import 'package:dartz/dartz.dart';
import 'package:ntigradproject/feature/home/data/models/silder/silder_model.dart';

abstract class SliderRepo {
  Future<Either<String, SilderModel>> getSliderData();
}
