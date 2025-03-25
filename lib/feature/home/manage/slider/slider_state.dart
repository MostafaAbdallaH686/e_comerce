part of 'slider_cubit.dart';

@immutable
abstract class SliderState {}

class SliderInitial extends SliderState {}

class SliderLoadingState extends SliderState {}

class SliderSuccessState extends SliderState {
  final SilderModel sliderData;
  SliderSuccessState(this.sliderData);
}

class SliderFailureState extends SliderState {
  final String errMessage;

  SliderFailureState({required this.errMessage});
}
