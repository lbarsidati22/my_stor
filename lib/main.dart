import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_stor/core/cache_helper.dart';
import 'package:my_stor/core/utils/app_constants.dart';
import 'package:my_stor/core/utils/routes/app_router.dart';
import 'package:my_stor/core/utils/routes/app_routes.dart';
import 'package:my_stor/core/utils/theme/app_theme.dart';
import 'package:my_stor/features/auth/auth_cubit/auth_cubit.dart';
import 'package:my_stor/features/home/cubit/home_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.cacheInitialation();
  AppConstants.token = CacheHelper.getCacheData(key: 'token');
  print('your token is ${AppConstants.token}');
  runApp(const MyShop());
}

class MyShop extends StatelessWidget {
  const MyShop({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) {
            return AuthCubit();
          },
        ),
        BlocProvider(
          create: (context) {
            return HomeCubit()
              ..getBanners()
              ..getCategories()
              ..getProducts();
          },
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.mainTheme,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppConstants.token != null && AppConstants.token != ''
            ? AppRoutes.homeRoute
            : AppRoutes.authRoute,
      ),
    );
  }
}
