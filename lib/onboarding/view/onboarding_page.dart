import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_news/l10n/l10n.dart';
import 'package:flutter_news/routes/routes.dart';
import 'package:flutter_news/theme/theme.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({super.key});

  static List<String> imageUrls = [
    "assets/images/onboarding.png",
    "assets/images/onboarding.png",
    "assets/images/onboarding.png",
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final router = GoRouter.of(context);
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            CarouselWidget(imageUrls: imageUrls),
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(height: 34.0),
                  Text(
                    l10n.onboardingTitle,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 24.0),
                  Text(
                    l10n.onboardingDesctiption,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: AppColors.greyPrimary,
                      fontSize: 16.0,
                    ),
                  ),
                  const SizedBox(height: 64.0),
                  FilledButton(
                    onPressed: () {
                      router.goNamed(PAGES.welcome.name);
                    },
                    child: Text(l10n.next),
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

class CarouselWidget extends StatefulWidget {
  const CarouselWidget({
    super.key,
    required this.imageUrls,
  });

  final List<String> imageUrls;

  @override
  State<CarouselWidget> createState() => _CarouselWidgetState();
}

class _CarouselWidgetState extends State<CarouselWidget> {
  int activeIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          itemCount: widget.imageUrls.length,
          itemBuilder: (context, index, realIndex) =>
              CarouselItem(imageUrl: widget.imageUrls[index]),
          options: CarouselOptions(
            height: 336.0,
            enlargeCenterPage: true,
            enlargeStrategy: CenterPageEnlargeStrategy.height,
            onPageChanged: (index, reason) {
              setState(() {
                activeIndex = index;
              });
            },
          ),
        ),
        const SizedBox(height: 40.0),
        AnimatedSmoothIndicator(
          effect: const ExpandingDotsEffect(
            dotHeight: 8.0,
            dotWidth: 8.0,
            spacing: 8.0,
            dotColor: AppColors.greyLighter,
          ),
          activeIndex: activeIndex,
          count: widget.imageUrls.length,
        ),
      ],
    );
  }
}

class CarouselItem extends StatelessWidget {
  const CarouselItem({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey,
        image: DecorationImage(
          image: AssetImage(imageUrl),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
