import '../../models/project.dart';
import 'project_data.dart';

/// Repository interface to access projects cleanly without widget-level data coupling.
class ProjectRepository {
  const ProjectRepository();

  List<Project> getAllProjects() => ProjectData.allProjects;

  List<Project> getProfessionalProjects() => ProjectData.allProjects
      .where((p) => p.category == ProjectCategory.professional)
      .toList();

  List<Project> getIndependentProjects() => ProjectData.allProjects
      .where((p) => p.category == ProjectCategory.independent)
      .toList();

  List<Project> getFeaturedProjects() =>
      ProjectData.allProjects.where((p) => p.featured).toList();

  Project? getProjectBySlug(String slug) {
    try {
      return ProjectData.allProjects.firstWhere((p) => p.slug == slug);
    } catch (_) {
      return null;
    }
  }

  /// Returns the next project in the canonical portfolio sequence (Professional -> Independent).
  /// Returns the next project in the canonical portfolio sequence (null for the last project).
  Project? getNextProject(String currentSlug) {
    final projects = getAllProjects();
    final currentIndex = projects.indexWhere((p) => p.slug == currentSlug);
    if (currentIndex == -1 || currentIndex >= projects.length - 1) return null;
    return projects[currentIndex + 1];
  }

  /// Returns the previous project in the canonical portfolio sequence (null for the first project).
  Project? getPreviousProject(String currentSlug) {
    final projects = getAllProjects();
    final currentIndex = projects.indexWhere((p) => p.slug == currentSlug);
    if (currentIndex <= 0) return null;
    return projects[currentIndex - 1];
  }
}
