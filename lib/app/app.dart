import 'package:flutter/material.dart';
import 'package:flutter_news/routes/app_router.dart';
import 'package:flutter_news/l10n/l10n.dart';
import 'package:flutter_news/theme/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final appRouter = AppRouter();

    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.light,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      routerConfig: appRouter.router,
    );
  }
}
