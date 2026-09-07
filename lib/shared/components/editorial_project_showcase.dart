import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_theme.dart';
import '../../models/project.dart';
import 'custom_cursor_overlay.dart';
import 'image_placeholder.dart';

/// Compact Square Bento project showcase card matching mchiu.co.uk aesthetics.
/// Replaces wide horizontal banners with balanced, modular square bento boxes.
class EditorialProjectShowcase extends StatefulWidget {
  final Project project;
  final String index;
  final bool isFeatured;

  const EditorialProjectShowcase({
    super.key,
    required this.project,
    required this.index,
    this.isFeatured = false,
  });

  @override
  State<EditorialProjectShowcase> createState() =>
      _EditorialProjectShowcaseState();
}

class _EditorialProjectShowcaseState extends State<EditorialProjectShowcase> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;
    final isMobile = ResponsiveLayout.isMobile(context);

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
        onTap: () => context.go('/work/${project.slug}'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOutCubic,
          width: double.infinity,
          transform: Matrix4.translationValues(0.0, _isHovered ? -5.0 : 0.0, 0.0),
          padding: EdgeInsets.all(isMobile ? 20.0 : 28.0),
          decoration: BoxDecoration(
            color: AppTheme.surfaceRaised,
            borderRadius: BorderRadius.circular(AppTheme.bentoRadius),
            border: Border.all(
              color: _isHovered
                  ? AppTheme.primary.withValues(alpha: 0.35)
                  : AppTheme.border,
              width: 1.0,
            ),
            boxShadow: _isHovered ? AppTheme.cardHoverShadow : AppTheme.cardShadow,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              // 1. Visual Preview Box (Top) — Square / Modular Frame
              if (_hasVisualMedia(project))
                _buildVisualPreview(project, isMobile)
              else
                _buildBrandIdentityPreview(project, isMobile),

              const SizedBox(height: 20.0),

              // 2. Meta Pill Badges: Index, Category, Company
              Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 8.0,
                runSpacing: 6.0,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFEFECE6),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Text(
                      widget.index,
                      style: AppTheme.caption.copyWith(
                        fontSize: 11.0,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.foreground,
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFF2EFEB),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Text(
                      _formatTitleCase(project.projectType),
                      style: AppTheme.caption.copyWith(
                        letterSpacing: 0.3,
                        fontSize: 10.5,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.foregroundMuted,
                      ),
                    ),
                  ),
                  if (project.company != null)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2EFEB),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Text(
                        project.company!,
                        style: AppTheme.caption.copyWith(
                          fontSize: 10.0,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.foregroundSubtle,
                        ),
                      ),
                    ),
                  if (project.isDesignConfidential)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 9.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFF2EFEB),
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(color: AppTheme.border, width: 0.8),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.lock_outline_rounded,
                            size: 10.5,
                            color: AppTheme.foregroundSubtle,
                          ),
                          const SizedBox(width: 4.0),
                          Text(
                            'Confidential',
                            style: AppTheme.caption.copyWith(
                              fontSize: 10.0,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.foregroundSubtle,
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),

              const SizedBox(height: 14.0),

              // 3. Project Title
              Text(
                project.title,
                style: AppTheme.h3.copyWith(
                  fontSize: isMobile ? 18.0 : 21.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.3,
                  color: _isHovered ? AppTheme.primary : AppTheme.foreground,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 10.0),

              // 4. Description (Clamped for compact square balance)
              Text(
                project.description,
                style: AppTheme.bodySmall.copyWith(
                  color: AppTheme.foregroundMuted,
                  height: 1.5,
                  fontSize: 13.5,
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),

              const SizedBox(height: 20.0),

              // 5. Footer: Role Metadata & Case Study Pill Button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      'Role: ${project.role}',
                      style: AppTheme.caption.copyWith(
                        color: AppTheme.foregroundSubtle,
                        fontSize: 11.5,
                        fontWeight: FontWeight.w500,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 180),
                    padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 7.0),
                    decoration: BoxDecoration(
                      color: _isHovered ? AppTheme.primary : const Color(0xFFF2EFEB),
                      borderRadius: BorderRadius.circular(100.0),
                      border: Border.all(
                        color: _isHovered ? AppTheme.primary : AppTheme.border,
                        width: 1.0,
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          project.caseStudyAvailable ? 'Read Study' : 'View',
                          style: AppTheme.label.copyWith(
                            fontSize: 11.5,
                            fontWeight: FontWeight.w700,
                            color: _isHovered ? Colors.white : AppTheme.foreground,
                          ),
                        ),
                        const SizedBox(width: 4.0),
                        Icon(
                          Icons.arrow_forward_rounded,
                          size: 12.0,
                          color: _isHovered ? Colors.white : AppTheme.foreground,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  bool _hasVisualMedia(Project project) {
    return project.thumbnail != null || project.heroImage != null;
  }

  Widget _buildVisualPreview(Project project, bool isMobile) {
    final imgPath = project.thumbnail ?? project.heroImage!;

    return Semantics(
      label: '${project.shortTitle} preview visual',
      image: true,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F2EC),
          borderRadius: BorderRadius.circular(20.0),
          border: Border.all(color: AppTheme.border, width: 1.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: AnimatedScale(
          scale: _isHovered ? 1.035 : 1.0,
          duration: const Duration(milliseconds: 320),
          curve: Curves.easeOutCubic,
          child: Image.asset(
            imgPath,
            width: double.infinity,
            fit: BoxFit.fitWidth,
            errorBuilder: (context, error, stackTrace) => ImagePlaceholder(
              label: '${project.shortTitle} — Preview',
              caption: 'Visual asset loading',
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildBrandIdentityPreview(Project project, bool isMobile) {
    final height = isMobile ? 140.0 : 180.0;

    return Container(
      width: double.infinity,
      height: height,
      padding: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: const Color(0xFFF7F5F0),
        borderRadius: BorderRadius.circular(20.0),
        border: Border.all(color: AppTheme.border, width: 1.0),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (project.brandLogo != null)
              Image.asset(
                project.brandLogo!,
                height: 32.0,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) => const Icon(
                  Icons.business_outlined,
                  size: 28.0,
                  color: AppTheme.foregroundSubtle,
                ),
              )
            else
              const Icon(
                Icons.layers_outlined,
                size: 28.0,
                color: AppTheme.foregroundSubtle,
              ),
            const SizedBox(height: 12.0),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(100.0),
                border: Border.all(color: AppTheme.border),
              ),
              child: Text(
                '${project.shortTitle} • Project Identity',
                style: AppTheme.caption.copyWith(
                  color: AppTheme.foregroundSubtle,
                  fontSize: 10.5,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _formatTitleCase(String text) {
    if (text.isEmpty) return text;
    return text.split(' ').map((word) {
      if (word.isEmpty) return word;
      return word[0].toUpperCase() + word.substring(1).toLowerCase();
    }).join(' ');
  }
}
