import 'package:auth_repository/auth_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_news/common/common.dart';
import 'package:flutter_news/login/bloc/login_bloc.dart';
import 'package:flutter_news/routes/routes.dart';
import 'package:flutter_news/theme/theme.dart';
import 'package:go_router/go_router.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginBloc(authRepository: context.read<AuthRepository>()),
      child: const SignInView(),
    );
  }
}

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final router = GoRouter.of(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 28.0, 20.0, 0.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const AppTitle(
                        title: "Welcome Back 👋",
                        description:
                            "I am happy to see you again. You can\ncontinue where you left off by logging in",
                      ),
                      const SizedBox(height: 32.0),
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Email Address",
                                prefixIcon: Icon(AppIcons.envelope),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(AppIcons.lock),
                              ),
                            ),
                            const SizedBox(height: 8.0),
                            InkWell(
                              borderRadius: BorderRadius.circular(8.0),
                              onTap: () => router.goNamed(PAGES.forgot.name),
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text(
                                  "Forgot Password?",
                                  style: TextStyle(
                                    color: AppColors.greyPrimary,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            FilledButton(
                              onPressed: () {
                                context
                                    .read<LoginBloc>()
                                    .add(const LogInWithCredentials());
                                // loginInfo.login('userName');
                              },
                              child: const Text("Sign In"),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    'or',
                    style: TextStyle(
                      color: AppColors.greyPrimary,
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Column(
                    children: [
                      OutlinedButton(
                        onPressed: () {
                          context
                              .read<LoginBloc>()
                              .add(const LogInWithGoogle());
                        },
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.abc),
                            Text(
                              "Sign in with Google",
                              style: TextStyle(
                                color: AppColors.greyDark,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 24.0, width: 24.0),
                          ],
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      OutlinedButton(
                        onPressed: () {},
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.abc),
                            Text(
                              "Sign in with Facebook",
                              style: TextStyle(
                                color: AppColors.greyDark,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 24.0, width: 24.0),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account?",
                          style: TextStyle(
                            color: AppColors.greyDark,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 8.0),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            "Sign Up",
                            style: TextStyle(
                              color: AppColors.blackPrimary,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
