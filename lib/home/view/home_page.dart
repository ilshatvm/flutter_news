import 'package:flutter/material.dart';

import 'package:flutter_news/common/common.dart';
import 'package:flutter_news/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static List<String> categories = [
    "Random",
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

  static List<News> newsList = [
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            const SliverAppBar(
              floating: false,
              pinned: false,
              snap: false,
              stretch: true,
              expandedHeight: 125.0,
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 28.0),
                      AppTitle(
                        title: "Browse",
                        description: "Discover things of this world",
                      ),
                      SizedBox(height: 32.0),
                    ],
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: SearchBar(
                  leading: Icon(AppIcons.search),
                  trailing: [Icon(AppIcons.microphone)],
                  hintText: "Search",
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: SizedBox(
                  height: 32.0,
                  child: ListView.builder(
                    itemCount: categories.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          right: index == categories.length - 1 ? 20.0 : 16.0,
                          left: index == 0 ? 20.0 : 0.0,
                        ),
                        child: FilterChip(
                          labelStyle: TextStyle(
                            color: index == 0
                                ? Colors.white
                                : AppColors.greyPrimary,
                          ),
                          showCheckmark: false,
                          selected: index == 0,
                          label: Text(
                            categories[index],
                            style: const TextStyle(
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          onSelected: (value) {},
                          padding: const EdgeInsets.symmetric(horizontal: 0.0),
                          labelPadding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                          surfaceTintColor: Colors.transparent,
                          backgroundColor: AppColors.greyLighter,
                          shape: const StadiumBorder(),
                          side: BorderSide.none,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 0.0),
                child: SizedBox(
                  height: 256.0,
                  child: ListView.builder(
                    itemCount: newsList.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return NewsItemWidgetMedium(
                        news: newsList[index],
                        margin: EdgeInsets.only(
                          right: index == newsList.length - 1 ? 20.0 : 16.0,
                          left: index == 0 ? 20.0 : 0.0,
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 48.0, 20.0, 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Recommended for you",
                      style: TextStyle(
                        color: AppColors.blackPrimary,
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "See All",
                      style: TextStyle(
                        color: AppColors.greyPrimary,
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList.builder(
              itemCount: newsList.length,
              itemBuilder: (context, index) => NewsItemWidgetSmall(
                news: newsList[index],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewsItemWidgetSmall extends StatelessWidget {
  const NewsItemWidgetSmall({
    super.key,
    required this.news,
  });

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 16.0),
      child: Row(
        children: [
          Container(
            height: 96.0,
            width: 96.0,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
              image: DecorationImage(
                image: AssetImage(news.imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 16.0),
          SizedBox(
            width: MediaQuery.of(context).size.width - 152.0,
            height: 96.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  news.tag,
                  style: const TextStyle(
                    color: AppColors.greyPrimary,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  news.title,
                  maxLines: 2,
                  style: const TextStyle(
                    color: AppColors.blackPrimary,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewsItemWidgetMedium extends StatelessWidget {
  const NewsItemWidgetMedium({
    super.key,
    required this.news,
    required this.margin,
  });

  final EdgeInsets margin;

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256.0,
      width: 256.0,
      alignment: Alignment.bottomLeft,
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        image: DecorationImage(
          image: AssetImage(news.imageUrl),
          fit: BoxFit.cover,
        ),
      ),
      margin: margin,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          const Icon(
            AppIcons.bookmark,
            color: Colors.white,
          ),
          SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  news.tag.toUpperCase(),
                  style: const TextStyle(
                    color: AppColors.greyLighter,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  news.title,
                  maxLines: 3,
                  style: const TextStyle(
                    color: AppColors.greyLighter,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
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
