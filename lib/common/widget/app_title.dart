import 'package:flutter/material.dart';
import 'package:flutter_news/theme/theme.dart';

class AppTitle extends StatelessWidget {
  const AppTitle({super.key, required this.title, required this.description});

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 8.0),
        Text(
          description,
          style: const TextStyle(color: AppColors.greyPrimary, fontSize: 16.0),
        ),
        const SizedBox(height: 32.0),
      ],
    );
  }
}
