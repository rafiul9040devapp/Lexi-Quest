import 'package:flutter/material.dart';
import 'package:lexi_quest/core/theme/app_theme.dart';
import 'core/get_it/get_it.dart';
import 'core/router/app_router.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setup();
  runApp(
    MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
      theme: AppTheme.getTheme(),
    ),
  );
}
