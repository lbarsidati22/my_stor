import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_stor/features/home/cubit/home_state.dart';
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
        print('done banners is ${result.data}');
      } else {
        emit(BannersError(result.message));
        print('have error is ${result.message}');
      }
    } catch (e) {
      emit(BannersError(e.toString()));
      print('have error is ${e.toString()}');
    }
  }
}
