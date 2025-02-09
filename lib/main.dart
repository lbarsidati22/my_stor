import 'package:flutter/material.dart';
import 'package:my_stor/core/utils/routes/app_router.dart';
import 'package:my_stor/core/utils/routes/app_routes.dart';
import 'package:my_stor/core/utils/theme/app_theme.dart';

void main() {
  runApp(const MyShop());
}

class MyShop extends StatelessWidget {
  const MyShop({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: AppTheme.mainTheme,
      onGenerateRoute: AppRouter.onGenerateRoute,
      initialRoute: AppRoutes.authRoute,
    );
  }
}
