import 'package:flutter/material.dart';
import 'package:my_stor/core/utils/routes/app_routes.dart';
import 'package:my_stor/core/utils/theme/app_colors.dart';
import 'package:my_stor/core/views/widgets/main_bottom.dart';
import 'package:my_stor/features/auth/views/widgets/label_with_text_feiled.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            LabelWithTextFeiled(
              hintText: 'Enter your email',
              icon: Icons.mail,
              controller: emailController,
              label: 'Email',
            ),
            SizedBox(
              height: 10,
            ),
            LabelWithTextFeiled(
              hintText: 'Enter your password',
              icon: Icons.lock,
              controller: passwordController,
              label: 'Password',
              sufexIcon: IconButton(
                onPressed: () {},
                icon: Icon(Icons.visibility),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            MainBottom(
              text: 'Sign In',
              onTap: () {
                Navigator.of(context).pushNamed(
                  AppRoutes.homeRoute,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Don\' have an account ?',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign Up',
                    style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: AppColors.primaryColor,
                        ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
