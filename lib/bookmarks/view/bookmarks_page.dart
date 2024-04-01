import 'package:flutter/material.dart';
import 'package:flutter_news/common/common.dart';
import 'package:flutter_news/home/view/home_page.dart';
import 'package:flutter_news/theme/theme.dart';

class BookmarksPage extends StatelessWidget {
  const BookmarksPage({super.key});

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
                  title: "Bookmarks",
                  description: "Saved articles to the library",
                ),
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(0.0),
              sliver: SliverList.builder(
                itemCount: newsList.length,
                itemBuilder: (context, index) =>
                    NewsItemWidgetSmall(news: newsList[index]),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(top: Radius.circular(12.0)),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              spreadRadius: 0.0,
              blurRadius: 0.0,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(12.0),
            topRight: Radius.circular(12.0),
          ),
          child: BottomNavigationBar(
            elevation: 0.0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            unselectedItemColor: AppColors.greyLight,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Icon(AppIcons.estate),
                ),
                label: "Home",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Icon(AppIcons.category),
                ),
                label: "Categories",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Icon(AppIcons.bookmark),
                ),
                label: "Favorites",
              ),
              BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.0),
                  child: Icon(AppIcons.user),
                ),
                label: "Profile",
              ),
            ],
            currentIndex: 0,
          ),
        ),
      ),
    );
  }
}

// class News {
//   final String imageUrl;
//   final String tag;
//   final String title;

//   const News({
//     required this.imageUrl,
//     required this.tag,
//     required this.title,
//   });
// }

// List<String> categories = [
//   "Sports",
//   "Gaming",
//   "Politics",
//   "Life",
//   "Animals",
//   "Nature",
//   "Food",
//   "Art",
//   "History",
//   "Fashion",
//   "Covid-19",
//   "Middle East",
// ];

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
];
