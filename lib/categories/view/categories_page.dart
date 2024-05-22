import 'package:flutter/material.dart';
import 'package:flutter_news/common/common.dart';
import 'package:flutter_news/theme/theme.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverPadding(
              padding: EdgeInsets.fromLTRB(20.0, 28.0, 20.0, 32.0),
              sliver: SliverToBoxAdapter(
                child: AppTitle(
                  title: "Categories",
                  description: "Thousands of articles in each category",
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverGrid.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, childAspectRatio: 2.0),
                itemCount: categories.length,
                itemBuilder: (context, index) => Container(
                  alignment: Alignment.center,
                  margin: const EdgeInsets.all(8.0),
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      side: const BorderSide(color: AppColors.greyLighter),
                    ),
                  ),
                  child: Text(
                    categories[index],
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: AppColors.greyDark,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class News {
  final String imageUrl;
  final String tag;
  final String title;

  const News({
    required this.imageUrl,
    required this.tag,
    required this.title,
  });
}

List<String> categories = [
  "Sports",
  "Gaming",
  "Politics",
  "Life",
  "Animals",
  "Nature",
  "Food",
  "Art",
  "History",
  "Fashion",
  "Covid-19",
  "Middle East",
];

List<News> newsList = [
  const News(
    imageUrl: "assets/images/news_1.png",
    tag: "Politics",
    title: "The latest situation in the presidential election",
  ),
  const News(
    imageUrl: "assets/images/news_2.png",
    tag: "Art",
    title: "An updated daily front page",
  ),
  const News(
    imageUrl: "assets/images/news_1.png",
    tag: "Politics",
    title: "The latest situation in the presidential election",
  ),
  const News(
    imageUrl: "assets/images/news_2.png",
    tag: "Art",
    title: "An updated daily front page",
  ),
  const News(
    imageUrl: "assets/images/news_1.png",
    tag: "Politics",
    title: "The latest situation in the presidential election",
  ),
  const News(
    imageUrl: "assets/images/news_2.png",
    tag: "Art",
    title: "An updated daily front page",
  ),
];
