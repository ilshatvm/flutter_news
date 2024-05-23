import 'package:flutter/material.dart';
import 'package:flutter_news/onboarding/view/onboarding_page.dart';
import 'package:flutter_news/routes/routes.dart';
import 'package:flutter_news/bookmarks/bookmarks.dart';
import 'package:flutter_news/categories/categories.dart';
import 'package:flutter_news/home/home.dart';
import 'package:flutter_news/login/login.dart';
import 'package:flutter_news/login/view/forgot_password_page.dart';
import 'package:flutter_news/profile/profile.dart';
import 'package:flutter_news/welcome/welcome.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
const _showOnboardingScreen = true;

final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
final _navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'navigator');
final _loginKey = GlobalKey<NavigatorState>(debugLabel: 'login');

class AppRouter {
  AppRouter();

  get router => _router;

  late final _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: PAGES.onboarding.path,
    redirect: (contex, state) {
      final isOnLogin = state.matchedLocation == PAGES.login.path;
      final isOnForgot = state.matchedLocation == PAGES.forgot.path;
      final isOnOnboard = state.matchedLocation == PAGES.onboarding.path;
      final isOnWelcome = state.matchedLocation == PAGES.welcome.path;
      final isLoggedIn = loginInfo.loggedIn;

      if (isOnOnboard && _showOnboardingScreen && !isLoggedIn) {
        return PAGES.onboarding.path;
      }

      if (isOnWelcome && !isLoggedIn && _showOnboardingScreen) {
        return PAGES.welcome.path;
      }
      if (!isOnLogin && !isOnForgot && !isLoggedIn && !isOnOnboard) {
        return PAGES.login.path;
      }
      if ((isOnLogin || isOnForgot) && isLoggedIn) return PAGES.home.path;
      if (isOnForgot && !isLoggedIn) return PAGES.forgot.path;
      return null;
    },
    refreshListenable: loginInfo,
    routes: <RouteBase>[
      ShellRoute(
        navigatorKey: _loginKey,
        builder: (context, state, child) => child,
        routes: [
          GoRoute(
            path: PAGES.login.path,
            name: PAGES.login.name,
            builder: (context, state) => const SignInPage(),
            routes: [
              GoRoute(
                path: PAGES.forgot.name,
                name: PAGES.forgot.name,
                builder: (context, state) => const ForgotPasswordPage(),
              ),
            ],
          ),
          GoRoute(
              path: PAGES.onboarding.path,
              name: PAGES.onboarding.name,
              builder: (context, state) => const OnboardingPage(),
              routes: [
                GoRoute(
                  path: PAGES.welcome.name,
                  name: PAGES.welcome.name,
                  builder: (context, state) => const WelcomePage(),
                ),
              ]),
        ],
      ),
      StatefulShellRoute.indexedStack(
        builder: (
          BuildContext context,
          GoRouterState state,
          StatefulNavigationShell navigationShell,
        ) {
          return AppNavBar(
            navigationShell: navigationShell,
            key: GlobalKey(debugLabel: "HomePage"),
          );
        },
        branches: <StatefulShellBranch>[
          StatefulShellBranch(
            navigatorKey: _navigatorKey,
            routes: <RouteBase>[
              GoRoute(
                path: PAGES.home.path,
                name: PAGES.home.name,
                builder: (context, state) => const HomePage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: PAGES.categories.path,
                name: PAGES.categories.name,
                builder: (context, state) => const CategoriesPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: PAGES.bookmarks.path,
                name: PAGES.bookmarks.name,
                builder: (context, state) => const BookmarksPage(),
              ),
            ],
          ),
          StatefulShellBranch(
            routes: <RouteBase>[
              GoRoute(
                path: PAGES.profile.path,
                name: PAGES.profile.name,
                builder: (context, state) => const ProfilePage(),
              ),
            ],
          ),
        ],
      ),
    ],
  );
}
