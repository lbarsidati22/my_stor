import 'package:flutter/material.dart';
import 'package:my_stor/core/utils/theme/app_colors.dart';
import 'package:my_stor/core/views/widgets/main_bottom.dart';
import 'package:my_stor/features/auth/views/pages/login_page.dart';
import 'package:my_stor/features/auth/views/widgets/label_with_text_feiled.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final usernameController = TextEditingController();
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
              hintText: 'Enter your Name',
              icon: Icons.person,
              controller: usernameController,
              label: 'User',
            ),
            SizedBox(
              height: 10,
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
              text: 'Sign Up',
              onTap: () {},
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account ?',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Sign In',
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
