import 'slider.dart';

class SilderModel {
  List<OfferSlider>? sliders;
  bool? status;

  SilderModel({this.sliders, this.status});

  factory SilderModel.fromJson(Map<String, dynamic> json) => SilderModel(
        sliders: (json['sliders'] as List<dynamic>?)
            ?.map((e) => OfferSlider.fromJson(e as Map<String, dynamic>))
            .toList(),
        status: json['status'] as bool?,
      );

  Map<String, dynamic> toJson() => {
        'sliders': sliders?.map((e) => e.toJson()).toList(),
        'status': status,
      };
}
