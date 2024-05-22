import 'package:flutter/material.dart';
import 'package:flutter_news/common/common.dart';

import '../../theme/theme.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

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
                      const AppTitle(
                        title: "Forgot Password 🤔",
                        description:
                            "We need your email adress so we can send you the password reset code.",
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
                            FilledButton(
                              onPressed: () {},
                              child: const Text("Next"),
                            ),
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
                          "Remember the password?",
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
                            "Try again",
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
