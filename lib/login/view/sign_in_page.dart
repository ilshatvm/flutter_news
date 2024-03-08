import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news/theme/theme.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                      const Text(
                        "Welcome Back 👋",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        "I am happy to see you again. You can continue where you left off by logging in",
                        style: TextStyle(
                          color: AppColors.greyPrimary,
                          fontSize: 16.0,
                        ),
                      ),
                      const SizedBox(height: 32.0),
                      Form(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Email Address",
                                prefixIcon: Icon(Icons.email),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            TextFormField(
                              decoration: const InputDecoration(
                                hintText: "Password",
                                prefixIcon: Icon(Icons.lock),
                              ),
                            ),
                            const SizedBox(height: 16.0),
                            const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                color: AppColors.greyPrimary,
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(height: 24.0),
                            FilledButton(
                              onPressed: () {},
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
                        onPressed: () {},
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
