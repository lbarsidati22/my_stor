import 'package:dio/dio.dart';
import 'package:my_stor/core/utils/app_constants.dart';
import 'package:my_stor/features/home/model/banner_model.dart';

class HomeServices {
  final aDio = Dio();
  Future<BannerResponse> getBanners() async {
    try {
      aDio.options.baseUrl = AppConstants.baseUrl;
      final response = await aDio.get('banners');
      if (response.statusCode == 200) {
        return BannerResponse.fromMap(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
