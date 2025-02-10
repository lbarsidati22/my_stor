import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_stor/core/utils/routes/app_routes.dart';
import 'package:my_stor/core/utils/theme/app_colors.dart';
import 'package:my_stor/core/views/widgets/main_bottom.dart';
import 'package:my_stor/features/auth/auth_cubit/auth_cubit.dart';
import 'package:my_stor/features/auth/auth_cubit/auth_state.dart';
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
    final authCubit = BlocProvider.of<AuthCubit>(context);
    final formKey = GlobalKey<FormState>();
    return Padding(
      padding: const EdgeInsets.all(24),
      child: SingleChildScrollView(
        child: Form(
          key: formKey,
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
              BlocConsumer<AuthCubit, AuthState>(
                bloc: authCubit,
                listenWhen: (previous, current) =>
                    current is AuthDone ||
                    current is AuthLeading ||
                    current is AuthError,
                listener: (context, state) {
                  if (state is AuthDone) {
                    Navigator.pushReplacementNamed(
                      context,
                      AppRoutes.homeRoute,
                    );
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.green,
                        content: Text(state.message ?? ''),
                      ),
                    );
                  } else if (state is AuthError) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: AppColors.red,
                        content: Text(state.message ?? ''),
                      ),
                    );
                  }
                },
                buildWhen: (previous, current) =>
                    current is AuthDone ||
                    current is AuthLeading ||
                    current is AuthError,
                builder: (context, state) {
                  if (state is AuthLeading) {
                    return MainBottom(
                      isLeading: true,
                      onTap: () {},
                    );
                  }
                  return MainBottom(
                    text: 'Sign In',
                    onTap: () async {
                      if (formKey.currentState!.validate() == true) {
                        await authCubit.login(
                            emailController.text, passwordController.text);
                      }
                    },
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
      ),
    );
  }
}
