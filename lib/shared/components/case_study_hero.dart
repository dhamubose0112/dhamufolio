import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
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

        // Optional Live Website Link or Confidential Design Files Action
        if (project.externalUrl != null) ...[
          const SizedBox(height: 24.0),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () async {
                final uri = Uri.parse(project.externalUrl!);
                if (await canLaunchUrl(uri)) {
                  await launchUrl(uri);
                }
              },
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text(
                      'Visit Live Website',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: 13.0,
                      ),
                    ),
                    SizedBox(width: 6.0),
                    Icon(Icons.arrow_outward_rounded, size: 14.0, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ] else if (project.isDesignConfidential) ...[
          const SizedBox(height: 24.0),
          if (isMobile)
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.go('/contact'),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 9.0),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceRaised,
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(color: AppTheme.border, width: 1.0),
                  ),
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: const [
                        Icon(Icons.lock_outline_rounded, size: 12.5, color: AppTheme.foregroundMuted),
                        SizedBox(width: 6.0),
                        Text(
                          'Design Files Confidential',
                          style: TextStyle(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.foreground,
                          ),
                        ),
                        SizedBox(width: 6.0),
                        Text('•', style: TextStyle(color: AppTheme.foregroundSubtle, fontSize: 11.0)),
                        SizedBox(width: 6.0),
                        Text(
                          'Contact Me',
                          style: TextStyle(
                            color: AppTheme.primary,
                            fontWeight: FontWeight.w700,
                            fontSize: 11.5,
                          ),
                        ),
                        SizedBox(width: 3.0),
                        Icon(Icons.arrow_forward_rounded, size: 11.5, color: AppTheme.primary),
                      ],
                    ),
                  ),
                ),
              ),
            )
          else
            Wrap(
              spacing: 12.0,
              runSpacing: 10.0,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                UnconstrainedBox(
                  constrainedAxis: Axis.vertical,
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.5),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2EFEB),
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(color: AppTheme.border, width: 1.0),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Icon(
                          Icons.lock_outline_rounded,
                          size: 13.5,
                          color: AppTheme.foregroundMuted,
                        ),
                        const SizedBox(width: 6.0),
                        Text(
                          'Design Files Confidential (NDA)',
                          style: AppTheme.label.copyWith(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.foregroundMuted,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                UnconstrainedBox(
                  constrainedAxis: Axis.vertical,
                  child: MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => context.go('/contact'),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                        decoration: BoxDecoration(
                          color: AppTheme.primary,
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: const [
                            Icon(Icons.mail_outline_rounded, size: 14.0, color: Colors.white),
                            SizedBox(width: 8.0),
                            Text(
                              'Contact Me to View',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 13.0,
                              ),
                            ),
                            SizedBox(width: 6.0),
                            Icon(Icons.arrow_forward_rounded, size: 14.0, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
        ],

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
              child: Image.asset(
                project.heroImage!,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                errorBuilder: (context, error, stackTrace) => const SizedBox.shrink(),
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
