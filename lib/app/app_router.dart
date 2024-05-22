import 'package:flutter/material.dart';
import 'package:flutter_news/app/app_nav_bar.dart';
import 'package:flutter_news/bookmarks/bookmarks.dart';
import 'package:flutter_news/categories/categories.dart';
import 'package:flutter_news/home/home.dart';
import 'package:flutter_news/login/login.dart';
import 'package:flutter_news/profile/profile.dart';
import 'package:go_router/go_router.dart';

class LoginInfo extends ChangeNotifier {
  String get userName => _userName;
  String _userName = '';
  bool get loggedIn => _userName.isNotEmpty;

  void login(String userName) {
    _userName = userName;
    notifyListeners();
  }

  void logout() {
    _userName = '';
    notifyListeners();
  }
}

final loginInfo = LoginInfo();

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'navigator');

final GoRouter router = GoRouter(
  debugLogDiagnostics: true,
  navigatorKey: _rootNavigatorKey,
  initialLocation: '/',
  redirect: (context, state) {
    final bool loggedIn = loginInfo.loggedIn;
    final bool loggingIn = state.matchedLocation == '/login';
    if (!loggedIn) {
      return '/login';
    }
    if (loggingIn) {
      return '/';
    }
    return null;
  },
  refreshListenable: loginInfo,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (
        BuildContext context,
        GoRouterState state,
        StatefulNavigationShell navigationShell,
      ) {
        return state.matchedLocation == '/login'
            ? navigationShell
            : AppNavBar(
                navigationShell: navigationShell,
                key: GlobalKey(debugLabel: "HomePage"),
              );
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _navigatorKey,
          routes: <RouteBase>[
            GoRoute(
                path: '/',
                builder: (context, state) => const HomePage(),
                routes: [
                  GoRoute(
                    path: 'login',
                    builder: (context, state) => const SignInPage(),
                  ),
                ]),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/hotels',
              builder: (context, state) => const CategoriesPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/location',
              builder: (context, state) => const BookmarksPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: <RouteBase>[
            GoRoute(
              path: '/subscriptions',
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
