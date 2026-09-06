import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_theme.dart';
import '../../data/projects/project_repository.dart';
import '../../models/project.dart';
import '../../shared/components/contact_cta.dart';
import '../../shared/components/editorial_project_showcase.dart';
import '../../shared/components/editorial_section_header.dart';
import '../../shared/layout/page_scaffold.dart';

/// Work page presenting Professional Work and Independent Projects
/// formatted uniformly into 2-column square bento grids.
class WorkPage extends StatelessWidget {
  const WorkPage({super.key});

  @override
  Widget build(BuildContext context) {
    const repository = ProjectRepository();
    final professionalProjects = repository.getProfessionalProjects();
    final independentProjects = repository.getIndependentProjects();
    final isMobile = ResponsiveLayout.isMobile(context);
    final sectionGap = isMobile ? AppConstants.sectionGapMobile : AppConstants.sectionGapDesktop;

    return PageScaffold(
      currentPath: '/work',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Page Header
          const EditorialSectionHeader(
            index: 'Index',
            title: 'Selected Work',
          ),
          const SizedBox(height: 16.0),
          Text(
            'Products, Systems & Case Studies',
            style: isMobile ? AppTheme.chapterHeaderMobile : AppTheme.chapterHeader,
          ),
          const SizedBox(height: 20.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760.0),
            child: Text(
              'A curated body of product design work encompassing enterprise SaaS lead management, customer-facing mobile apps, B2B partner portals, and independent freelance projects.',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.foregroundMuted,
                height: 1.6,
              ),
            ),
          ),

          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // SECTION 1: PROFESSIONAL WORK (2-COLUMN SQUARE BENTO GRID)
          // -----------------------------------------------------------
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12.0,
            children: [
              Text('01 /', style: AppTheme.sectionIndex.copyWith(fontSize: 13.0, fontWeight: FontWeight.w700)),
              Text('Professional Work', style: isMobile ? AppTheme.h2 : AppTheme.h1.copyWith(fontSize: 26.0)),
              Text(
                '(${professionalProjects.length})',
                style: AppTheme.caption.copyWith(
                  color: AppTheme.foregroundSubtle,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            'Enterprise SaaS platforms, customer mobile apps, and UX redesigns designed during full-time and freelance roles.',
            style: AppTheme.body.copyWith(
              color: AppTheme.foregroundMuted,
            ),
          ),
          const SizedBox(height: 32.0),

          // 2-Column Square Bento Grid for Professional Work
          _buildProjectBentoGrid(professionalProjects, isMobile, prefix: '0'),

          SizedBox(height: sectionGap),
          const Divider(),
          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // SECTION 2: INDEPENDENT & FREELANCE PROJECTS (2-COLUMN GRID)
          // -----------------------------------------------------------
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12.0,
            children: [
              Text('02 /', style: AppTheme.sectionIndex.copyWith(fontSize: 13.0, fontWeight: FontWeight.w700)),
              Text('Independent & Freelance Projects', style: isMobile ? AppTheme.h2 : AppTheme.h1.copyWith(fontSize: 26.0)),
              Text(
                '(${independentProjects.length})',
                style: AppTheme.caption.copyWith(
                  color: AppTheme.foregroundSubtle,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            'Self-directed applications, automation concepts, and client web projects bridging design with modern frontend development.',
            style: AppTheme.body.copyWith(
              color: AppTheme.foregroundMuted,
            ),
          ),
          const SizedBox(height: 32.0),

          // 2-Column Square Bento Grid for Independent Projects
          _buildProjectBentoGrid(independentProjects, isMobile, prefix: 'I-'),

          SizedBox(height: sectionGap),
          const ContactCTA(),
        ],
      ),
    );
  }

  Widget _buildProjectBentoGrid(
    List<Project> projects,
    bool isMobile, {
    required String prefix,
  }) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 768;

        if (isNarrow) {
          return Column(
            children: projects.asMap().entries.map((entry) {
              final indexStr = '$prefix${entry.key + 1}';
              final isRealVisualDominant = entry.value.slug == 'maradhi' ||
                  entry.value.slug == 'real-estate-event-landing-page';

              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: EditorialProjectShowcase(
                  project: entry.value,
                  index: indexStr,
                  isFeatured: isRealVisualDominant,
                ),
              );
            }).toList(),
          );
        }

        // 2-Column Balanced Grid of Square Bento Cards
        final leftList = <MapEntry<int, Project>>[];
        final rightList = <MapEntry<int, Project>>[];

        for (var i = 0; i < projects.length; i++) {
          if (i % 2 == 0) {
            leftList.add(MapEntry(i, projects[i]));
          } else {
            rightList.add(MapEntry(i, projects[i]));
          }
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: leftList.map((entry) {
                  final indexStr = '$prefix${entry.key + 1}';
                  final isRealVisualDominant = entry.value.slug == 'maradhi' ||
                      entry.value.slug == 'real-estate-event-landing-page';

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: EditorialProjectShowcase(
                      project: entry.value,
                      index: indexStr,
                      isFeatured: isRealVisualDominant,
                    ),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(width: 24.0),
            Expanded(
              child: Column(
                children: rightList.map((entry) {
                  final indexStr = '$prefix${entry.key + 1}';
                  final isRealVisualDominant = entry.value.slug == 'maradhi' ||
                      entry.value.slug == 'real-estate-event-landing-page';

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 24.0),
                    child: EditorialProjectShowcase(
                      project: entry.value,
                      index: indexStr,
                      isFeatured: isRealVisualDominant,
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        );
      },
    );
  }
}
