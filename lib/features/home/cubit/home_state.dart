import 'package:my_stor/features/home/model/banner_model.dart';

sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class BannersLeading extends HomeState {}

final class BannersLoaded extends HomeState {
  final List<BannerData>? data;

  BannersLoaded(this.data);
}

final class BannersError extends HomeState {
  final String? message;

  BannersError(this.message);
}
