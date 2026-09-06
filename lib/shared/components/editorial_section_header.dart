import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

/// Editorial section header with index number and title.
class EditorialSectionHeader extends StatelessWidget {
  final String index;
  final String title;
  final String? subtitle;

  const EditorialSectionHeader({
    super.key,
    required this.index,
    required this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              index,
              style: AppTheme.sectionIndex.copyWith(
                color: AppTheme.foregroundSubtle,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(width: 8.0),
            Text(
              '/',
              style: AppTheme.sectionIndex.copyWith(color: AppTheme.borderStrong),
            ),
            const SizedBox(width: 8.0),
            Flexible(
              child: Text(
                title,
                style: AppTheme.sectionIndex.copyWith(
                  color: AppTheme.foregroundMuted,
                  letterSpacing: 0.6,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
        if (subtitle != null) ...[
          const SizedBox(height: 10.0),
          Text(
            subtitle!,
            style: AppTheme.h2.copyWith(
              color: AppTheme.foreground,
              letterSpacing: -0.4,
            ),
          ),
        ],
      ],
    );
  }
}
