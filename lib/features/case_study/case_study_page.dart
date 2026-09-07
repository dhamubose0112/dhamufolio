import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_constants.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_theme.dart';
import '../../data/projects/project_repository.dart';
import '../../models/case_study.dart';
import '../../models/project.dart';
import '../../shared/components/case_study_hero.dart';
import '../../shared/components/case_study_meta.dart';
import '../../shared/components/case_study_navigation.dart';
import '../../shared/components/case_study_showcase_slot.dart';
import '../../shared/components/documentation_in_progress.dart';
import '../../shared/components/editorial_section_header.dart';
import '../../shared/components/primary_button.dart';
import '../../shared/layout/page_scaffold.dart';

/// Redesigned, fully data-driven Case Study page.
/// Dynamically renders canonical sections (01-07) strictly supported by verified project data.
class CaseStudyPage extends StatelessWidget {
  final String slug;

  const CaseStudyPage({super.key, required this.slug});

  @override
  Widget build(BuildContext context) {
    const repository = ProjectRepository();
    final project = repository.getProjectBySlug(slug);

    if (project == null) {
      return _buildNotFoundState(context);
    }

    final previousProject = repository.getPreviousProject(slug);
    final nextProject = repository.getNextProject(slug);
    final allProjects = repository.getAllProjects();
    final projectIndexInt = allProjects.indexWhere((p) => p.slug == slug) + 1;
    final projectIndexStr = projectIndexInt < 10 ? '0$projectIndexInt' : '$projectIndexInt';

    final isMobile = ResponsiveLayout.isMobile(context);
    final sectionGap = isMobile ? AppConstants.sectionGapMobile : AppConstants.sectionGapDesktop;

    return PageScaffold(
      currentPath: '/work/$slug',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -----------------------------------------------------------
          // 1. HERO HEADER
          // -----------------------------------------------------------
          CaseStudyHero(
            project: project,
            projectIndex: projectIndexStr,
          ),

          SizedBox(height: sectionGap / 2),

          // -----------------------------------------------------------
          // 2. VERIFIED METADATA BAR
          // -----------------------------------------------------------
          CaseStudyMeta(project: project),

          SizedBox(height: sectionGap / 2),
          const Divider(),
          SizedBox(height: sectionGap / 2),

          // -----------------------------------------------------------
          // 3. STRUCTURED CASE STUDY SECTIONS (01 - 07)
          // -----------------------------------------------------------
          ..._buildCaseStudySections(context, project, isMobile, sectionGap),

          // If no deep-dive sections exist beyond overview, show Documentation In Progress
          if (_isDocumentationPending(project)) ...[
            DocumentationInProgress(projectTitle: project.shortTitle),
            SizedBox(height: sectionGap),
          ],

          // -----------------------------------------------------------
          // 4. BIDIRECTIONAL NAVIGATION FOOTER
          // -----------------------------------------------------------
          CaseStudyNavigation(
            previousProject: previousProject,
            nextProject: nextProject,
          ),
        ],
      ),
    );
  }

  /// Evaluates whether the project has in-depth walkthrough sections or is in pending state.
  bool _isDocumentationPending(Project project) {
    final hasProblem = project.getSection(CaseStudySectionType.problem) != null;
    final hasContext = project.getSection(CaseStudySectionType.context) != null;
    final hasRole = project.getSection(CaseStudySectionType.myRole) != null;
    final hasProcess = project.getSection(CaseStudySectionType.processAndDesignSystem) != null;
    final hasShowcase = project.getSection(CaseStudySectionType.designShowcase) != null;
    final hasOutcome = project.getSection(CaseStudySectionType.outcome) != null ||
        (project.verifiedOutcome != null && project.verifiedOutcome!.trim().isNotEmpty);

    return !hasProblem && !hasContext && !hasRole && !hasProcess && !hasShowcase && !hasOutcome;
  }

  /// Builds canonical case study sections adhering strictly to verified data.
  List<Widget> _buildCaseStudySections(
      BuildContext context, Project project, bool isMobile, double sectionGap) {
    final widgets = <Widget>[];

    void addSection({
      required String index,
      required String title,
      String? description,
      String? content,
      Widget? visualContent,
    }) {
      widgets.add(
        Padding(
          padding: EdgeInsets.only(bottom: sectionGap),
          child: isMobile
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EditorialSectionHeader(index: index, title: title),
                    const SizedBox(height: 18.0),
                    if (description != null) ...[
                      Text(
                        description,
                        style: AppTheme.bodyLarge.copyWith(
                          color: AppTheme.foreground,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 14.0),
                    ],
                    if (content != null) ...[
                      Text(
                        content,
                        style: AppTheme.body.copyWith(
                          color: AppTheme.foregroundMuted,
                          height: 1.6,
                        ),
                      ),
                      const SizedBox(height: 20.0),
                    ],
                    ?visualContent,
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: 260.0,
                          child: EditorialSectionHeader(index: index, title: title),
                        ),
                        const SizedBox(width: 48.0),
                        Expanded(
                          child: ConstrainedBox(
                            constraints: const BoxConstraints(maxWidth: 720.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                if (description != null) ...[
                                  Text(
                                    description,
                                    style: AppTheme.bodyLarge.copyWith(
                                      color: AppTheme.foreground,
                                      height: 1.6,
                                    ),
                                  ),
                                  const SizedBox(height: 16.0),
                                ],
                                if (content != null) ...[
                                  Text(
                                    content,
                                    style: AppTheme.body.copyWith(
                                      color: AppTheme.foregroundMuted,
                                      height: 1.65,
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    if (visualContent != null) ...[
                      const SizedBox(height: 36.0),
                      visualContent,
                    ],
                  ],
                ),
        ),
      );
    }

    // 01 / OVERVIEW
    final overview = project.getSection(CaseStudySectionType.overview);
    if (overview != null) {
      addSection(
        index: '01',
        title: overview.title,
        description: overview.description,
        content: overview.content,
      );
    }

    // 02 / The Problem
    final problem = project.getSection(CaseStudySectionType.problem);
    if (problem != null) {
      addSection(
        index: '02',
        title: problem.title,
        description: problem.description,
        content: problem.content,
      );
    }

    // 03 / Context
    final contextSec = project.getSection(CaseStudySectionType.context);
    if (contextSec != null) {
      addSection(
        index: '03',
        title: contextSec.title,
        description: contextSec.description,
        content: contextSec.content,
      );
    }

    // 04 / My Role
    final myRole = project.getSection(CaseStudySectionType.myRole);
    if (myRole != null) {
      addSection(
        index: '04',
        title: myRole.title,
        description: myRole.description,
        content: myRole.content,
      );
    }

    // 05 / Process & Design System (Never assumed; rendered strictly when verified)
    final process = project.getSection(CaseStudySectionType.processAndDesignSystem);
    if (process != null) {
      addSection(
        index: '05',
        title: process.title,
        description: process.description,
        content: process.content,
      );
    }

    // 06 / Design Showcase
    final designShowcase = project.getSection(CaseStudySectionType.designShowcase);
    if (designShowcase != null) {
      // Omit cover photo if it's already shown as the hero visual at the top of the case study
      final showcaseImages = designShowcase.images
          .where((img) => img != project.heroImage && img != project.thumbnail)
          .toList();

      addSection(
        index: '06',
        title: designShowcase.title,
        description: designShowcase.description,
        content: designShowcase.content,
        visualContent: showcaseImages.isNotEmpty
            ? CaseStudyShowcaseSlot(
                title: project.shortTitle,
                slotType: designShowcase.showcaseType ?? ShowcaseSlotType.fullWidth,
                caption: designShowcase.caption,
                images: showcaseImages,
              )
            : null,
      );
    }

    // 07 / Outcome (Rendered only when outcome section or verifiedOutcome exists)
    final outcome = project.getSection(CaseStudySectionType.outcome);
    final hasVerifiedOutcome = project.verifiedOutcome != null &&
        project.verifiedOutcome!.trim().isNotEmpty;

    if (outcome != null || hasVerifiedOutcome) {
      addSection(
        index: '07',
        title: outcome?.title ?? 'Outcome & Takeaways',
        description: outcome?.description ?? project.verifiedOutcome,
        content: outcome?.content,
      );
    }

    // If project has confidential design files under NDA, show full-width card with Contact Me action
    if (project.isDesignConfidential) {
      widgets.add(
        Padding(
          padding: EdgeInsets.only(bottom: sectionGap),
          child: _buildConfidentialDesignCard(context, project, isMobile),
        ),
      );
    }

    return widgets;
  }

  /// Builds an editorial confidential card explaining NDA status and offering a Contact Me button.
  Widget _buildConfidentialDesignCard(
      BuildContext context, Project project, bool isMobile) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(isMobile ? 18.0 : 32.0),
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(AppConstants.radiusMedium),
        border: Border.all(color: AppTheme.border, width: 1.0),
        boxShadow: AppTheme.cardShadow,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(7.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFF2EFEB),
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(color: AppTheme.border),
                ),
                child: const Icon(
                  Icons.lock_outline_rounded,
                  size: 14.0,
                  color: AppTheme.foregroundMuted,
                ),
              ),
              const SizedBox(width: 10.0),
              Flexible(
                child: Text(
                  'CONFIDENTIAL DESIGN FILES & SYSTEM SPECS',
                  style: AppTheme.sectionIndex.copyWith(
                    letterSpacing: 0.6,
                    fontSize: isMobile ? 10.5 : 11.5,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            'Design Files Protected Under NDA',
            style: isMobile ? AppTheme.h3 : AppTheme.h2,
          ),
          const SizedBox(height: 10.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720.0),
            child: Text(
              'Detailed Figma prototypes, user flow maps, component design systems, and interaction specs for ${project.title} are protected under confidentiality agreements with ${project.company ?? 'the organization'}. Private design walkthroughs and portfolio demonstrations can be scheduled upon request.',
              style: AppTheme.body.copyWith(
                color: AppTheme.foregroundMuted,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 22.0),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => context.go('/contact'),
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 14.0 : 22.0,
                  vertical: isMobile ? 9.0 : 11.0,
                ),
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(Icons.mail_outline_rounded, size: 14.0, color: Colors.white),
                    const SizedBox(width: 6.0),
                    Text(
                      isMobile ? 'Contact Me to View' : 'Contact Me to View Design Files',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w700,
                        fontSize: isMobile ? 12.0 : 13.0,
                      ),
                    ),
                    const SizedBox(width: 5.0),
                    const Icon(Icons.arrow_forward_rounded, size: 13.0, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotFoundState(BuildContext context) {
    return PageScaffold(
      currentPath: '/work',
      child: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 80.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.search_off_rounded,
                size: 48.0,
                color: AppTheme.foregroundSubtle,
              ),
              const SizedBox(height: 16.0),
              const Text('Project Not Found', style: AppTheme.h1),
              const SizedBox(height: 12.0),
              const Text(
                'The project you requested does not exist or has been moved.',
                style: AppTheme.body,
              ),
              const SizedBox(height: 24.0),
              PrimaryButton(
                label: 'Back to All Work',
                onPressed: () => context.go('/work'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
