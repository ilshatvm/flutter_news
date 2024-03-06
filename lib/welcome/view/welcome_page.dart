import 'package:flutter/material.dart';
import 'package:flutter_news/theme/theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Image.asset("assets/images/welcome.png"),
            const SizedBox(height: 120.0),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    child: Column(
                      children: [
                        Text(
                          "Nuntium",
                          style: TextStyle(
                            fontSize: 34.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        SizedBox(height: 24.0),
                        Text(
                          "All news in one place, be the\nfirst to know last news",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: AppColors.greyPrimary,
                            fontSize: 16.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 64.0),
                  FilledButton(
                    onPressed: () {},
                    child: const Text("Get Started"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
