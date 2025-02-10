import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_stor/core/cache_helper.dart';
import 'package:my_stor/core/model/softagi_response.dart';
import 'package:my_stor/features/auth/auth_cubit/auth_state.dart';
import 'package:my_stor/features/auth/model/user_data_body.dart';
import 'package:my_stor/features/auth/model/user_data_response.dart';
import 'package:my_stor/features/auth/services/auth_services.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());
  final authServices = AuthServices();
  Future<void> login(
    String email,
    String password,
  ) async {
    emit(AuthLeading());
    try {
      final body = UserDataBody(
        email: email,
        password: password,
      );
      final result = await authServices.login(body);
      if (result.status == true) {
        print('login done your name is  ${result.data!.name}');
        print('login done your  ${result.data!.email}');
        CacheHelper.setCacheData(
          key: 'token',
          value: result.data!.token!,
        );
        emit(AuthDone(result.data, result.message));
      } else {
        print('User error login and his error : ${result.message}');
        emit(AuthError(result.message));
      }
    } catch (e) {
      emit(AuthError(e.toString()));
    }
  }
}
