import 'package:flutter/material.dart';
import 'package:my_stor/core/utils/routes/app_routes.dart';
import 'package:my_stor/features/auth/views/pages/auth_page.dart';
import 'package:my_stor/features/home/views/pages/nav_bar.dart';
import 'package:my_stor/features/home/views/pages/product_details_page.dart';

class AppRouter {
  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.homeRoute:
        return MaterialPageRoute(
          builder: (_) => NavBar(),
          settings: settings,
        );
      case AppRoutes.authRoute:
        return MaterialPageRoute(
          builder: (_) => AuthPage(),
          settings: settings,
        );
      case AppRoutes.productDetailsRoute:
        return MaterialPageRoute(
          builder: (_) => ProductDetailsPage(),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
        );
    }
  }
}
