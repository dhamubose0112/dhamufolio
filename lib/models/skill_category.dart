/// Skill category grouping model.
class SkillCategory {
  final String id;
  final String title;
  final String? subtitle;
  final bool isPrimary;
  final List<String> skills;

  const SkillCategory({
    required this.id,
    required this.title,
    this.subtitle,
    required this.isPrimary,
    required this.skills,
  });
}
