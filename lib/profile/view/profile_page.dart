import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_news/common/common.dart';
import 'package:flutter_news/theme/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 92.0,
        title: const Text(
          "Profile",
          style: TextStyle(
            color: AppColors.blackDark,
            fontSize: 24.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              const Row(
                children: [
                  CircleAvatar(
                    radius: 36.0,
                    child: FlutterLogo(
                      size: 36.0,
                    ),
                  ),
                  SizedBox(width: 24.0),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Eren Turkmen',
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        'ertuken@gmail.com',
                        style: TextStyle(
                          color: AppColors.greyPrimary,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32.0),
              ProfilePageButtonWidget(
                title: 'Notifications',
                actionWidget: CupertinoSwitch(
                  activeColor: AppColors.purplePrimary,
                  value: true,
                  onChanged: (value) {},
                ),
                onPressed: () {},
              ),
              const SizedBox(height: 16.0),
              ProfilePageButtonWidget(
                title: 'Language',
                onPressed: () {},
              ),
              const SizedBox(height: 16.0),
              ProfilePageButtonWidget(
                title: 'Change Password',
                onPressed: () {},
              ),
              const SizedBox(height: 32.0),
              ProfilePageButtonWidget(
                title: 'Privacy',
                onPressed: () {},
              ),
              const SizedBox(height: 16.0),
              ProfilePageButtonWidget(
                title: 'Terms & Conditions',
                onPressed: () {},
              ),
              const SizedBox(height: 32.0),
              ProfilePageButtonWidget(
                title: 'Sign Out',
                actionWidget: const Icon(AppIcons.signout),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFFACAFC3).withOpacity(0.32),
              spreadRadius: 0.0,
              blurRadius: 0.0,
              offset: const Offset(0.0, -1.0),
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

class ProfilePageButtonWidget extends StatelessWidget {
  const ProfilePageButtonWidget({
    super.key,
    required this.title,
    this.actionWidget,
    required this.onPressed,
  });

  final String title;
  final Widget? actionWidget;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 56.0,
        decoration: BoxDecoration(
          color: AppColors.greyLighter,
          borderRadius: BorderRadius.circular(12.0),
        ),
        padding: const EdgeInsets.fromLTRB(24.0, 16.0, 16.0, 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: AppColors.greyDark,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            actionWidget ?? const Icon(AppIcons.angle),
          ],
        ),
      ),
    );
  }
}
