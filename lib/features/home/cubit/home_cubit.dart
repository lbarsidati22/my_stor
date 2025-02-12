import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_stor/features/home/cubit/home_state.dart';
import 'package:my_stor/features/home/model/category_model.dart';
import 'package:my_stor/features/home/services/home_services.dart';
import 'package:my_stor/features/home/model/banner_model.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  final homeServices = HomeServices();
  Future<void> getBanners() async {
    print('get banners started');
    emit(BannersLeading());
    try {
      final result = await homeServices.getBanners();
      if (result.status == true) {
        emit(BannersLoaded(result.data ?? []));
      } else {
        emit(BannersError(result.message));
      }
    } catch (e) {
      emit(BannersError(e.toString()));
    }
  }

  // List<CategoryData> categories = [];
  Future<void> getCategories() async {
    emit(CategoryLeading());
    try {
      final result = await homeServices.getCategories();
      if (result.status == true) {
        emit(CategoryLoaded(result.data!.data));
      } else {
        emit(CategoryError(result.message));
      }
    } catch (e) {
      emit(CategoryError(e.toString()));
    }
  }

  Future<void> getProducts() async {
    emit(ProductsLeading());
    try {
      final result = await homeServices.getProducts();
      if (result.status == true) {
        emit(ProductsLoaded(result.data!.products));
      } else {
        emit(ProductsError(result.message));
      }
    } catch (e) {
      emit(ProductsError(e.toString()));
    }
  }
}
