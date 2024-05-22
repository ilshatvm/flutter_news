import 'package:flutter/material.dart';
import 'package:flutter_news/common/app_icons.dart';
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
            const SliverAppBar(
              pinned: true,
              snap: false,
              floating: false,
              expandedHeight: 88.0,
              flexibleSpace: FlexibleSpaceBar(
                expandedTitleScale: 1.0,
                centerTitle: false,
                titlePadding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 12.0),
                title: Text(
                  'Bookmarks',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.w600,
                    color: AppColors.blackDark,
                  ),
                ),
              ),
            ),
            const SliverPadding(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 32.0),
              sliver: SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                  child: Text(
                    'Saved articles to the library',
                    style: TextStyle(
                      color: AppColors.greyPrimary,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            // const SliverPadding(
            //   padding: EdgeInsets.fromLTRB(20.0, 28.0, 20.0, 32.0),
            //   sliver: SliverToBoxAdapter(
            //     child: AppTitle(
            //       title: "Bookmarks",
            //       description: "Saved articles to the library",
            //     ),
            //   ),
            // ),
            SliverPadding(
              padding: const EdgeInsets.all(0.0),
              sliver: newsList.isEmpty
                  ? const SliverFillRemaining(
                      hasScrollBody: false,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: AppColors.greyLighter,
                            radius: 36.0,
                            child: Icon(
                              AppIcons.book,
                              color: AppColors.purplePrimary,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(60.0, 24.0, 60.0, 0.0),
                            child: Text(
                              "You haven't saved any articles\nto yet. Start reading and\nbookmarking them now",
                              textAlign: TextAlign.center,
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
                  : SliverList.builder(
                      itemCount: newsList.length,
                      itemBuilder: (context, index) =>
                          NewsItemWidgetSmall(news: newsList[index]),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}

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
