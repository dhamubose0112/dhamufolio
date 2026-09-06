/// Category of professional experience.
enum ExperienceCategory {
  productDesign,
  creativeDomain,
}

/// Experience entry model.
class Experience {
  final String id;
  final String role;
  final String? company;
  final String? location;
  final String? duration;
  final ExperienceCategory category;
  final List<String> responsibilities;
  final List<String> focusAreas;

  const Experience({
    required this.id,
    required this.role,
    this.company,
    this.location,
    this.duration,
    required this.category,
    this.responsibilities = const [],
    this.focusAreas = const [],
  });
}
