import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_theme.dart';
import '../../models/case_study.dart';

/// Reusable structural showcase slot for case studies.
/// Supports both real visual assets (images) and clean documentation fallback states.
/// Layout options:
/// - fullWidth (single large hero/flow banner)
/// - twoColumn (side-by-side screens)
/// - deviceMockup (centered mobile/device screen)
/// - annotatedScreen (screen with documentation canvas)
/// - mobileGrid (2-up or 4-up responsive mobile screen grid)
/// - editorialSplit (large hero + supporting detail visual)
class CaseStudyShowcaseSlot extends StatelessWidget {
  final String title;
  final String? caption;
  final ShowcaseSlotType slotType;
  final List<String> images;

  const CaseStudyShowcaseSlot({
    super.key,
    required this.title,
    this.caption,
    this.slotType = ShowcaseSlotType.fullWidth,
    this.images = const [],
  });

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);

    switch (slotType) {
      case ShowcaseSlotType.mobileGrid:
        return _buildMobileGridLayout(context, isMobile);
      case ShowcaseSlotType.editorialSplit:
        return _buildEditorialSplitLayout(context, isMobile);
      case ShowcaseSlotType.twoColumn:
        return _buildTwoColumnLayout(context, isMobile);
      case ShowcaseSlotType.deviceMockup:
        return _buildDeviceMockupLayout(context, isMobile);
      case ShowcaseSlotType.annotatedScreen:
        return _buildAnnotatedScreenLayout(context, isMobile);
      case ShowcaseSlotType.fullWidth:
        return _buildFullWidthLayout(context, isMobile);
    }
  }

  // 1. FULL WIDTH LAYOUT
  Widget _buildFullWidthLayout(BuildContext context, bool isMobile) {
    final hasRealImage = images.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasRealImage)
          _buildRealImageFrame(
            imagePath: images.first,
            altText: '$title overview screenshot',
          )
        else
          _buildPlaceholderCanvas(
            height: isMobile ? 220.0 : 380.0,
            label: '$title — Full Architecture Canvas',
            icon: Icons.dashboard_customize_outlined,
          ),
        if (caption != null) ...[
          const SizedBox(height: 12.0),
          _buildCaption(caption!),
        ],
      ],
    );
  }

  // 2. TWO COLUMN LAYOUT
  Widget _buildTwoColumnLayout(BuildContext context, bool isMobile) {
    final hasRealImages = images.length >= 2;

    if (!hasRealImages) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildPlaceholderCanvas(
            height: isMobile ? 180.0 : 220.0,
            label: '$title — Interface & Flow Documentation',
            icon: Icons.splitscreen_rounded,
          ),
          if (caption != null) ...[
            const SizedBox(height: 12.0),
            _buildCaption(caption!),
          ],
        ],
      );
    }

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRealImageFrame(
            imagePath: images[0],
            altText: '$title primary view',
            aspectRatio: 16 / 9,
          ),
          const SizedBox(height: 16.0),
          _buildRealImageFrame(
            imagePath: images[1],
            altText: '$title detail view',
            aspectRatio: 16 / 9,
          ),
          if (caption != null) ...[
            const SizedBox(height: 12.0),
            _buildCaption(caption!),
          ],
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: _buildRealImageFrame(
                imagePath: images[0],
                altText: '$title primary view',
                aspectRatio: 16 / 9,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              child: _buildRealImageFrame(
                imagePath: images[1],
                altText: '$title detail view',
                aspectRatio: 16 / 9,
              ),
            ),
          ],
        ),
        if (caption != null) ...[
          const SizedBox(height: 12.0),
          _buildCaption(caption!),
        ],
      ],
    );
  }

  // 3. DEVICE MOCKUP LAYOUT
  Widget _buildDeviceMockupLayout(BuildContext context, bool isMobile) {
    final hasRealImage = images.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasRealImage)
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: isMobile ? 320.0 : 420.0),
              child: _buildRealImageFrame(
                imagePath: images.first,
                altText: '$title mobile device view',
                aspectRatio: 9 / 16,
              ),
            ),
          )
        else
          _buildPlaceholderCanvas(
            height: isMobile ? 240.0 : 340.0,
            label: '$title — Mobile / Device View',
            icon: Icons.phone_iphone_rounded,
          ),
        if (caption != null) ...[
          const SizedBox(height: 12.0),
          _buildCaption(caption!),
        ],
      ],
    );
  }

  // 4. ANNOTATED SCREEN LAYOUT
  Widget _buildAnnotatedScreenLayout(BuildContext context, bool isMobile) {
    final hasRealImage = images.isNotEmpty;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hasRealImage)
          _buildRealImageFrame(
            imagePath: images.first,
            altText: '$title annotated workflow screen',
            aspectRatio: 16 / 10,
          )
        else
          _buildPlaceholderCanvas(
            height: isMobile ? 220.0 : 340.0,
            label: '$title — Annotated Workflow Screen',
            icon: Icons.rate_review_outlined,
          ),
        if (caption != null) ...[
          const SizedBox(height: 12.0),
          _buildCaption(caption!),
        ],
      ],
    );
  }

  // 5. MOBILE GRID LAYOUT (Responsive 2-up on mobile, 4-up on desktop)
  Widget _buildMobileGridLayout(BuildContext context, bool isMobile) {
    final screenImages = images;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (screenImages.isNotEmpty)
          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 640;
              final crossAxisCount = isNarrow ? 2 : 4;
              final spacing = 12.0;
              final itemWidth = (constraints.maxWidth - (spacing * (crossAxisCount - 1))) / crossAxisCount;

              return Wrap(
                spacing: spacing,
                runSpacing: spacing,
                children: screenImages.map((imgPath) {
                  return SizedBox(
                    width: itemWidth,
                    child: _buildRealImageFrame(
                      imagePath: imgPath,
                      altText: '$title screen showcase',
                      aspectRatio: 9 / 16,
                    ),
                  );
                }).toList(),
              );
            },
          )
        else
          _buildPlaceholderCanvas(
            height: 280.0,
            label: '$title — Mobile Screen Sequence',
            icon: Icons.grid_view_rounded,
          ),
        if (caption != null) ...[
          const SizedBox(height: 16.0),
          _buildCaption(caption!),
        ],
      ],
    );
  }

  // 6. EDITORIAL SPLIT LAYOUT (Large + Small)
  Widget _buildEditorialSplitLayout(BuildContext context, bool isMobile) {
    if (images.length < 2) {
      return _buildFullWidthLayout(context, isMobile);
    }

    if (isMobile) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildRealImageFrame(
            imagePath: images[0],
            altText: '$title primary showcase',
            aspectRatio: 16 / 9,
          ),
          const SizedBox(height: 12.0),
          _buildRealImageFrame(
            imagePath: images[1],
            altText: '$title secondary detail',
            aspectRatio: 16 / 9,
          ),
          if (caption != null) ...[
            const SizedBox(height: 12.0),
            _buildCaption(caption!),
          ],
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: _buildRealImageFrame(
                imagePath: images[0],
                altText: '$title primary showcase',
                aspectRatio: 16 / 9,
              ),
            ),
            const SizedBox(width: 16.0),
            Expanded(
              flex: 3,
              child: Column(
                children: [
                  _buildRealImageFrame(
                    imagePath: images[1],
                    altText: '$title secondary detail',
                    aspectRatio: 16 / 9,
                  ),
                  if (images.length >= 3) ...[
                    const SizedBox(height: 16.0),
                    _buildRealImageFrame(
                      imagePath: images[2],
                      altText: '$title tertiary detail',
                      aspectRatio: 16 / 9,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
        if (caption != null) ...[
          const SizedBox(height: 12.0),
          _buildCaption(caption!),
        ],
      ],
    );
  }

  // FRAME FOR REAL ASSETS
  Widget _buildRealImageFrame({
    required String imagePath,
    required String altText,
    double? aspectRatio,
  }) {
    return Semantics(
      label: altText,
      image: true,
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF4F2EC),
          borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
          border: Border.all(color: AppTheme.border, width: 1.0),
        ),
        clipBehavior: Clip.antiAlias,
        child: aspectRatio != null
            ? AspectRatio(
                aspectRatio: aspectRatio,
                child: Image.asset(
                  imagePath,
                  width: double.infinity,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return _buildPlaceholderCanvas(
                      height: 120.0,
                      label: '$title — Asset not found',
                      icon: Icons.broken_image_outlined,
                    );
                  },
                ),
              )
            : Image.asset(
                imagePath,
                width: double.infinity,
                fit: BoxFit.fitWidth,
                errorBuilder: (context, error, stackTrace) {
                  return _buildPlaceholderCanvas(
                    height: 120.0,
                    label: '$title — Asset not found',
                    icon: Icons.broken_image_outlined,
                  );
                },
              ),
      ),
    );
  }

  // UNDERSTATED TYPOGRAPHY-FIRST FALLBACK CANVAS
  Widget _buildPlaceholderCanvas({
    required double height,
    required String label,
    required IconData icon,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
      decoration: BoxDecoration(
        color: AppTheme.surface,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(color: AppTheme.border, width: 1.0),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(icon, size: 20.0, color: AppTheme.foregroundSubtle),
          const SizedBox(width: 16.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  label,
                  style: AppTheme.label.copyWith(color: AppTheme.foreground),
                ),
                const SizedBox(height: 4.0),
                Text(
                  'Visual documentation in progress • System analysis detailed in narrative sections',
                  style: AppTheme.caption.copyWith(
                    color: AppTheme.foregroundSubtle,
                    fontSize: 11.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCaption(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('— ', style: TextStyle(color: AppTheme.foregroundSubtle)),
        Expanded(
          child: Text(
            text,
            style: AppTheme.caption.copyWith(color: AppTheme.foregroundMuted),
          ),
        ),
      ],
    );
  }
}
