import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_news/app/app.dart';

class AppRunner {
  Future<void> run() async {
    runZonedGuarded(
      () async {
        await _init();
        runApp(const App());
      },
      (error, st) async => log(
        error.toString(),
        stackTrace: st,
        error: error,
      ),
    );
  }

  Future<void> _init() async {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [SystemUiOverlay.bottom, SystemUiOverlay.top],
    );
  }
}
