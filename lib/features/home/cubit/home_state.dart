import 'package:my_stor/core/model/softagi_response.dart';
import 'package:my_stor/features/home/model/banner_model.dart';
import 'package:my_stor/features/home/model/category_model.dart';

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

final class CategoryLeading extends HomeState {}

final class CategoryLoaded extends HomeState {
  final List<CategoryData>? data;

  CategoryLoaded(this.data);
}

final class CategoryError extends HomeState {
  final String? message;

  CategoryError(this.message);
}

final class ProductsLeading extends HomeState {}

final class ProductsLoaded extends HomeState {
  final List<Products>? products;

  ProductsLoaded(this.products);
}

final class ProductsError extends HomeState {
  final String? message;

  ProductsError(this.message);
}
