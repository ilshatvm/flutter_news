import 'package:flutter/material.dart';
import 'package:flutter_news/l10n/l10n.dart';
import 'package:flutter_news/theme/theme.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
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
                  SizedBox(
                    child: Column(
                      children: [
                        Text(
                          l10n.welcomePageTitle,
                          style: const TextStyle(
                            fontSize: 34.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 24.0),
                        Text(
                          l10n.welcomePageDesctiption,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
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
                    child: Text(l10n.getStarted),
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
