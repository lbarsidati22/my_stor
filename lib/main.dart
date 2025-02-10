import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_stor/core/utils/routes/app_router.dart';
import 'package:my_stor/core/utils/routes/app_routes.dart';
import 'package:my_stor/core/utils/theme/app_theme.dart';
import 'package:my_stor/features/auth/auth_cubit/auth_cubit.dart';

void main() {
  runApp(const MyShop());
}

class MyShop extends StatelessWidget {
  const MyShop({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: AppTheme.mainTheme,
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: AppRoutes.authRoute,
      ),
    );
  }
}
