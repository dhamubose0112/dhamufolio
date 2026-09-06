import 'package:flutter/material.dart';
import '../core/theme/app_theme.dart';
import '../shared/components/custom_cursor_overlay.dart';
import 'app_config.dart';
import 'router.dart';

/// Root application widget.
class DhamuPortfolioApp extends StatelessWidget {
  const DhamuPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: AppConfig.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData,
      routerConfig: AppRouter.router,
      builder: (context, child) {
        return CustomCursorOverlay(child: child ?? const SizedBox.shrink());
      },
    );
  }
}
