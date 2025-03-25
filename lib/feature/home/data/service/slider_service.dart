import 'package:dio/dio.dart';
import 'package:ntigradproject/core/api/api_helper.dart';

class SliderService {
  final ApiHelper _apiHelper = ApiHelper();

  SliderService(ApiHelper _apiHelper);

  Future<Response?> getSlider() async {
    Response? response = await _apiHelper.get(endPoint: '/sliders');

    if (response != null) {
      print('=======================================');
      print('✅ Endpoint Name: Slider');
      print('📄 Status Code: ${response.statusCode}');
      print('📦 Data: ${response.data}');
      print('=======================================');
    } else {
      print('❌ Slider Failed: No Response from Server');
    }

    return response;
  }
}
