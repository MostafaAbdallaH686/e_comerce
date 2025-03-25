import 'package:dio/dio.dart';
import 'package:ntigradproject/core/api/api_helper.dart';

class BestSellerService {
  final ApiHelper apiHelper = ApiHelper();

  BestSellerService(ApiHelper apiHelper);
  Future<Response?> getBestSellers() async {
    Response? response = await apiHelper.get(endPoint: '/best_seller_products');

    if (response != null) {
      print('=======================================');
      print('✅ Endpoint Name: BestSeller');
      print('📄 Status Code: ${response.statusCode}');
      print('📦 Data: ${response.data}');
      print('=======================================');
    } else {
      print('❌ BestSeller Failed: No Response from Server');
    }

    return response;
  }
}
