import 'package:dio/dio.dart';
import 'package:my_stor/core/model/softagi_response.dart';
import 'package:my_stor/core/utils/app_constants.dart';
import 'package:my_stor/features/home/model/banner_model.dart';
import 'package:my_stor/features/home/model/category_model.dart';

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

  Future<CategoryResponse> getCategories() async {
    try {
      aDio.options.baseUrl = AppConstants.baseUrl;
      final headers = {
        'lang': 'en',
      };
      final response = await aDio.get('categories',
          options: Options(
            headers: headers,
          ));
      if (response.statusCode == 200) {
        return CategoryResponse.fromMap(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<SoftagiResponse> getProducts() async {
    try {
      aDio.options.baseUrl = AppConstants.baseUrl;
      final headers = {
        'Authorization': AppConstants.token,
        'lang': 'en',
      };
      final response = await aDio.get('home',
          options: Options(
            headers: headers,
          ));
      if (response.statusCode == 200) {
        return SoftagiResponse.fromMap(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
