import 'package:flutter/material.dart';
import 'package:flutter_news/app/bloc/app_bloc.dart';
import 'package:flutter_news/onboarding/view/onboarding_page.dart';
import 'package:flutter_news/routes/routes.dart';
import 'package:flutter_news/bookmarks/bookmarks.dart';
import 'package:flutter_news/categories/categories.dart';
import 'package:flutter_news/home/home.dart';
import 'package:flutter_news/login/login.dart';
import 'package:flutter_news/login/view/forgot_password_page.dart';
import 'package:flutter_news/profile/profile.dart';
import 'package:flutter_news/routes/utils/go_router_refresh_stream.dart';
import 'package:flutter_news/welcome/welcome.dart';
import 'package:go_router/go_router.dart';

const _showOnboardingScreen = true;

class AppRouter {
  final AppBloc bloc;

  AppRouter({required this.bloc});
  final _rootNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'root');
  final _navigatorKey = GlobalKey<NavigatorState>(debugLabel: 'navigator');
  final _loginKey = GlobalKey<NavigatorState>(debugLabel: 'login');

  get router => _router;

  late final _router = GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: PAGES.onboarding.path,
    redirect: (contex, state) {
      // final onboardIn = bloc.state == const AppState.unauthenticated();
      // final onboardingIn = state.matchedLocation == PAGES.onboarding.path;
      final isNotAuth = bloc.state == const AppState.unauthenticated();
      final loggingIn = state.matchedLocation == PAGES.login.path;
      // if (bloc.state is NotAuthenticated) return PAGES.login.path;
      // if (onboardIn) return onboardingIn ? null : PAGES.onboarding.path;
      if (isNotAuth) return loggingIn ? null : PAGES.login.path;
      if (isNotAuth) return loggingIn ? PAGES.home.path : state.path;

      // final isOnLogin = state.matchedLocation == PAGES.login.path;

      // final isOnOnboard = state.matchedLocation == PAGES.onboarding.path;
      // final isAutneticated = bloc.state.status == AppStatus.authenticated;

      // if (isOnOnboard && _showOnboardingScreen && !isLoggedIn) {
      //   return PAGES.onboarding.path;
      // }

      return null;
    },
    refreshListenable: GoRouterRefreshStream(bloc.stream),
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
