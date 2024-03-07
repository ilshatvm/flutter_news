import 'package:flutter/material.dart';
import 'package:flutter_news/theme/theme.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(20.0, 28.0, 20.0, 0.0),
            child: Column(
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
                      TextFormField(),
                      const SizedBox(height: 16.0),
                      TextFormField(),
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
          ),
        ),
      ),
    );
  }
}
