import 'case_study.dart';

/// Categories of projects in the portfolio.
enum ProjectCategory {
  professional,
  independent,
}

/// Project data model containing metadata and optional case study sections.
class Project {
  final String id;
  final String slug;
  final String title;
  final String shortTitle;
  final ProjectCategory category;
  final String projectType;
  final String description;
  final String role;
  final String? year;
  final String? company;
  final String? platform;
  final String? thumbnail;
  final String? heroImage;
  final String? brandLogo;
  final bool isLogoOnly;
  final List<String> tags;
  final bool featured;
  final bool caseStudyAvailable;
  final bool? isConfidential;
  final String? externalUrl;
  final String? verifiedOutcome;
  final List<CaseStudySection> sections;

  const Project({
    required this.id,
    required this.slug,
    required this.title,
    required this.shortTitle,
    required this.category,
    required this.projectType,
    required this.description,
    required this.role,
    this.year,
    this.company,
    this.platform,
    this.thumbnail,
    this.heroImage,
    this.brandLogo,
    this.isLogoOnly = false,
    this.tags = const [],
    this.featured = false,
    this.caseStudyAvailable = false,
    this.isConfidential,
    this.externalUrl,
    this.verifiedOutcome,
    this.sections = const [],
  });

  /// Whether design files for this project are confidential under NDA.
  bool get isDesignConfidential =>
      isConfidential ??
      (category == ProjectCategory.professional &&
          (externalUrl == null || externalUrl!.trim().isEmpty));

  /// Human-readable category label adhering to naming guidelines.
  String get categoryLabel {
    switch (category) {
      case ProjectCategory.professional:
        return 'Professional Work';
      case ProjectCategory.independent:
        return 'Independent & Freelance Projects';
    }
  }

  /// Returns only sections that have verified, non-empty content.
  List<CaseStudySection> get visibleSections =>
      sections.where((section) => section.hasContent).toList();

  /// Gets a specific section by type if it exists and has content.
  CaseStudySection? getSection(CaseStudySectionType type) {
    try {
      return visibleSections.firstWhere((s) => s.type == type);
    } catch (_) {
      return null;
    }
  }
}
