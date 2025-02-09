import 'package:flutter/material.dart';
import 'package:my_stor/core/utils/theme/app_colors.dart';
import 'package:my_stor/features/auth/views/pages/login_page.dart';
import 'package:my_stor/features/auth/views/pages/register.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        // title: Text(
        //   'Welcome',
        //   style: Theme.of(context).textTheme.headlineLarge!.copyWith(
        //         fontWeight: FontWeight.w600,
        //       ),
        // ),
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3,
          labelStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
                fontWeight: FontWeight.w600,
                color: AppColors.primaryColor,
              ),
          unselectedLabelStyle:
              Theme.of(context).textTheme.titleMedium!.copyWith(),
          tabs: [
            Tab(
              text: 'Sign In',
            ),
            Tab(text: 'Sign Up'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          LoginPage(),
          RegisterPage(),
        ],
      ),
    );
  }
}
