import 'package:dio/dio.dart';
import 'package:my_stor/core/utils/app_constants.dart';
import 'package:my_stor/features/auth/model/user_data_body.dart';
import 'package:my_stor/features/auth/model/user_data_response.dart';

class AuthServices {
  final aDio = Dio();
  Future<UserDataResponse> login(UserDataBody body) async {
    try {
      aDio.options.baseUrl = AppConstants.baseUrl;
      final headers = {
        'lang': 'ar',
      };
      final response = await aDio.post(
        'login',
        queryParameters: body.toMap(),
        options: Options(
          headers: headers,
        ),
      );
      if (response.statusCode == 200) {
        return UserDataResponse.fromMap(response.data);
      } else {
        throw Exception(response.statusMessage);
      }
    } catch (e) {
      rethrow;
    }
  }
}
