import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_constants.dart';
import '../../core/theme/app_theme.dart';
import '../../models/project.dart';
import 'custom_cursor_overlay.dart';

/// Reusable bidirectional case-study footer navigation.
/// Provides links to Previous Project, Next Project, and Back to All Work.
class CaseStudyNavigation extends StatelessWidget {
  final Project? previousProject;
  final Project? nextProject;

  const CaseStudyNavigation({
    super.key,
    this.previousProject,
    this.nextProject,
  });

  @override
  Widget build(BuildContext context) {
    final isCompact = MediaQuery.of(context).size.width < 900;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 32.0),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppTheme.border),
        ),
      ),
      child: isCompact
          ? _buildMobileLayout(context)
          : _buildDesktopLayout(context),
    );
  }

  Widget _buildDesktopLayout(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Previous Project
        Expanded(
          child: previousProject != null
              ? _EditorialNavProjectLink(
                  label: 'Previous',
                  project: previousProject!,
                  isPrevious: true,
                )
              : const SizedBox.shrink(),
        ),

        // Center: Back to Work
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: InkWell(
            onTap: () => context.go('/work'),
            borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              decoration: BoxDecoration(
                border: Border.all(color: AppTheme.border, width: 1.0),
                borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
              ),
              child: Text(
                'All Projects',
                style: AppTheme.caption.copyWith(
                  fontWeight: FontWeight.w600,
                  color: AppTheme.foregroundMuted,
                  letterSpacing: 0.5,
                ),
              ),
            ),
          ),
        ),

        // Next Project
        Expanded(
          child: nextProject != null
              ? Align(
                  alignment: Alignment.centerRight,
                  child: _EditorialNavProjectLink(
                    label: 'Next',
                    project: nextProject!,
                    isPrevious: false,
                  ),
                )
              : const SizedBox.shrink(),
        ),
      ],
    );
  }

  Widget _buildMobileLayout(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (nextProject != null) ...[
          _EditorialNavProjectLink(
            label: 'Next',
            project: nextProject!,
            isPrevious: false,
          ),
          const SizedBox(height: 16.0),
          const Divider(),
          const SizedBox(height: 16.0),
        ],
        if (previousProject != null) ...[
          _EditorialNavProjectLink(
            label: 'Previous',
            project: previousProject!,
            isPrevious: true,
          ),
          const SizedBox(height: 20.0),
        ],
        InkWell(
          onTap: () => context.go('/work'),
          borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
          child: Container(
            width: double.infinity,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            decoration: BoxDecoration(
              border: Border.all(color: AppTheme.border, width: 1.0),
              borderRadius: BorderRadius.circular(AppConstants.radiusSmall),
            ),
            child: Text(
              'Back to All Work',
              style: AppTheme.caption.copyWith(
                fontWeight: FontWeight.w600,
                color: AppTheme.foregroundMuted,
                letterSpacing: 0.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _EditorialNavProjectLink extends StatefulWidget {
  final String label;
  final Project project;
  final bool isPrevious;

  const _EditorialNavProjectLink({
    required this.label,
    required this.project,
    required this.isPrevious,
  });

  @override
  State<_EditorialNavProjectLink> createState() => _EditorialNavProjectLinkState();
}

class _EditorialNavProjectLinkState extends State<_EditorialNavProjectLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovered = true);
        CursorState.instance.setHovered(true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        CursorState.instance.setHovered(false);
      },
      child: GestureDetector(
        onTap: () => context.go('/work/${widget.project.slug}'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0.0, _isHovered ? -4.0 : 0.0, 0.0),
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14.0),
          decoration: BoxDecoration(
            color: AppTheme.surfaceRaised,
            borderRadius: BorderRadius.circular(20.0),
            border: Border.all(
              color: _isHovered
                  ? AppTheme.primary.withValues(alpha: 0.35)
                  : AppTheme.border,
              width: 1.0,
            ),
            boxShadow: _isHovered ? AppTheme.cardHoverShadow : AppTheme.cardShadow,
          ),
          child: Column(
            crossAxisAlignment:
                widget.isPrevious ? CrossAxisAlignment.start : CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (widget.isPrevious) ...[
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      transform: Matrix4.translationValues(_isHovered ? -3.0 : 0.0, 0.0, 0.0),
                      child: Icon(Icons.arrow_back_rounded,
                          size: 13.0, color: _isHovered ? AppTheme.primary : AppTheme.foregroundSubtle),
                    ),
                    const SizedBox(width: 6.0),
                  ],
                  Text(
                    widget.label,
                    style: AppTheme.sectionIndex.copyWith(
                      fontSize: 11.0,
                      color: _isHovered ? AppTheme.primary : AppTheme.foregroundSubtle,
                    ),
                  ),
                  if (!widget.isPrevious) ...[
                    const SizedBox(width: 6.0),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 180),
                      transform: Matrix4.translationValues(_isHovered ? 3.0 : 0.0, 0.0, 0.0),
                      child: Icon(Icons.arrow_forward_rounded,
                          size: 13.0, color: _isHovered ? AppTheme.primary : AppTheme.foregroundSubtle),
                    ),
                  ],
                ],
              ),
              const SizedBox(height: 6.0),
              Text(
                widget.project.shortTitle,
                style: AppTheme.h3.copyWith(
                  fontSize: 16.0,
                  color: _isHovered ? AppTheme.primary : AppTheme.foreground,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
