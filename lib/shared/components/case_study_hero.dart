import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_constants.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_theme.dart';
import '../../models/project.dart';
import 'editorial_section_header.dart';
import 'text_link.dart';

/// Reusable editorial hero header for case studies.
class CaseStudyHero extends StatelessWidget {
  final Project project;
  final String? projectIndex;

  const CaseStudyHero({
    super.key,
    required this.project,
    this.projectIndex,
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final categoryText = project.category == ProjectCategory.professional
        ? 'Professional Work'
        : 'Independent Project';
    final indexHeader = projectIndex != null
        ? '$categoryText / $projectIndex'
        : categoryText;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Navigation Back Link
        TextLink(
          text: '← Back to All Work',
          onTap: () => context.go('/work'),
        ),
        const SizedBox(height: 36.0),

        // Category / Index Header
        EditorialSectionHeader(
          index: 'Case Study',
          title: indexHeader,
        ),
        const SizedBox(height: 20.0),

        // Project Title
        Text(
          project.title,
          style: (isMobile ? AppTheme.display : AppTheme.editorialHero).copyWith(
            letterSpacing: isMobile ? -0.7 : -1.2,
          ),
        ),
        const SizedBox(height: 18.0),

        // Description / Summary
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxTextContentWidth),
          child: Text(
            project.description,
            style: AppTheme.bodyLarge,
          ),
        ),

        // Optional Real Hero Image or Brand Visual
        if (project.heroImage != null) ...[
          const SizedBox(height: 32.0),
          Semantics(
            label: '${project.shortTitle} hero visual',
            image: true,
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppTheme.surface,
                borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
                border: Border.all(color: AppTheme.border, width: 1.0),
              ),
              clipBehavior: Clip.antiAlias,
              child: AspectRatio(
                aspectRatio: isMobile ? 16 / 9 : 21 / 9,
                child: Image.asset(
                  project.heroImage!,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                ),
              ),
            ),
          ),
        ] else if (project.brandLogo != null) ...[
          const SizedBox(height: 24.0),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
            decoration: BoxDecoration(
              color: AppTheme.surface,
              borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
              border: Border.all(color: AppTheme.border, width: 1.0),
            ),
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 12.0,
              runSpacing: 6.0,
              children: [
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 140.0, maxHeight: 26.0),
                  child: Image.asset(
                    project.brandLogo!,
                    height: 26.0,
                    fit: BoxFit.contain,
                    errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
                  ),
                ),
                Text(
                  'Official Project Identity',
                  style: AppTheme.caption.copyWith(color: AppTheme.foregroundMuted),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }
}
