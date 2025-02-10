import 'package:my_stor/core/model/softagi_response.dart';
import 'package:my_stor/features/auth/model/user_data_body.dart';
import 'package:my_stor/features/auth/model/user_data_response.dart';

abstract class AuthState {}

class AuthInitial extends AuthState {}

class AuthDone extends AuthState {
  final UserData? data;
  final String? message;

  AuthDone(this.data, this.message);
}

class AuthLeading extends AuthState {}

class AuthError extends AuthState {
  final String? message;

  AuthError(this.message);
}
