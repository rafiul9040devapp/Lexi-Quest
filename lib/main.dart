import 'package:flutter/material.dart';
import 'package:lexi_quest/core/theme/app_theme.dart';

import 'core/router/app_router.dart';

void main() {
  runApp(
    MaterialApp.router(
      routerConfig: AppRouter.router,
      theme: AppTheme.getTheme(),
    ),
  );
}
