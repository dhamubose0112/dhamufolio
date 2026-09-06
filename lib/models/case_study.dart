/// Represents section types in an editorial product design case study.
enum CaseStudySectionType {
  overview,
  problem,
  context,
  myRole,
  processAndDesignSystem,
  designShowcase,
  outcome,
  custom,
}

/// Slot types for visual presentation in the design showcase.
/// Acts as future-proof placeholders ready to receive real assets in Phase 03B.
enum ShowcaseSlotType {
  fullWidth,
  twoColumn,
  deviceMockup,
  annotatedScreen,
  mobileGrid,
  editorialSplit,
}

/// Represents an editorial section inside a project case study.
/// Only sections with verified, non-empty content are displayed.
class CaseStudySection {
  final CaseStudySectionType type;
  final String title;
  final String? subtitle;
  final String? description;
  final String? content;
  final List<String> images;
  final ShowcaseSlotType? showcaseType;
  final String? caption;
  final Map<String, dynamic>? metadata;

  const CaseStudySection({
    required this.type,
    required this.title,
    this.subtitle,
    this.description,
    this.content,
    this.images = const [],
    this.showcaseType,
    this.caption,
    this.metadata,
  });

  bool get hasContent =>
      (description != null && description!.trim().isNotEmpty) ||
      (content != null && content!.trim().isNotEmpty) ||
      images.isNotEmpty ||
      showcaseType != null;
}
