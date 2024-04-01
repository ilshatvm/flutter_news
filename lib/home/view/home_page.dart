import 'package:flutter/material.dart';

import 'package:flutter_news/common/app_icons.dart';
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
                      return Container(
                        height: 256.0,
                        width: 256.0,
                        alignment: Alignment.bottomLeft,
                        padding: const EdgeInsets.all(24.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.red,
                          image: DecorationImage(
                            image: AssetImage(newsList[index].imageUrl),
                            fit: BoxFit.cover,
                          ),
                        ),
                        margin: EdgeInsets.only(
                          right: index == newsList.length - 1 ? 20.0 : 16.0,
                          left: index == 0 ? 20.0 : 0.0,
                        ),
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
                                    newsList[index].tag.toUpperCase(),
                                    style: const TextStyle(
                                      color: AppColors.greyLighter,
                                      fontSize: 12.0,
                                    ),
                                  ),
                                  const SizedBox(height: 8.0),
                                  Text(
                                    newsList[index].title,
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
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 16.0),
                child: Row(
                  children: [
                    Container(
                      height: 96.0,
                      width: 96.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12.0),
                        color: Colors.red,
                        image: DecorationImage(
                          image: AssetImage(newsList[index].imageUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 16.0),
                    SizedBox(
                      width: MediaQuery.of(context).size.width - 152.0,
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "UI/UX Design",
                            style: TextStyle(
                              color: AppColors.greyPrimary,
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "A Simple Trick For Creating Color Palettes Quickly",
                            style: TextStyle(
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
