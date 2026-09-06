import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import '../../shared/components/primary_button.dart';
import '../../shared/layout/page_scaffold.dart';

/// Clean 404 / route error page.
class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      currentPath: '/404',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceSubtle,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppTheme.border),
                ),
                child: const Icon(
                  Icons.explore_off_outlined,
                  size: 40.0,
                  color: AppTheme.foregroundMuted,
                ),
              ),
              const SizedBox(height: 24.0),
              const Text('404', style: AppTheme.display),
              const SizedBox(height: 12.0),
              const Text('Page Not Found', style: AppTheme.h2),
              const SizedBox(height: 16.0),
              ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 480.0),
                child: const Text(
                  'The page you requested could not be found. It may have been moved, renamed, or is temporarily unavailable.',
                  textAlign: TextAlign.center,
                  style: AppTheme.body,
                ),
              ),
              const SizedBox(height: 32.0),
              Wrap(
                spacing: 16.0,
                runSpacing: 12.0,
                children: [
                  PrimaryButton(
                    label: 'Return Home',
                    icon: Icons.home_outlined,
                    onPressed: () => context.go('/'),
                  ),
                  PrimaryButton(
                    label: 'Explore Work',
                    isSecondary: true,
                    icon: Icons.folder_outlined,
                    onPressed: () => context.go('/work'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
