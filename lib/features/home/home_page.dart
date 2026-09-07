import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_constants.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_theme.dart';
import '../../data/experience/experience_data.dart';
import '../../data/projects/project_repository.dart';
import '../../data/skills/skills_data.dart';
import '../../shared/components/bento_card.dart';
import '../../shared/components/contact_cta.dart';
import '../../shared/components/editorial_project_showcase.dart';
import '../../shared/components/experience_item.dart';
import '../../shared/components/skill_group_card.dart';
import '../../shared/layout/page_scaffold.dart';
import 'components/hero_bento_card.dart';
import 'components/social_bento_cards.dart';
import 'components/stats_bento_card.dart';

/// Bento Grid Home page matching the exact layout, theme, skeleton, and colors of mchiu.co.uk.
/// All sections and cards are formatted uniformly into modular, compact Square Bento Boxes.
class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const repository = ProjectRepository();
    final featuredProjects = repository.getFeaturedProjects();
    final currentRole = ExperienceData.productDesignExperiences.first;
    final topSkills = SkillsData.primaryCategories.take(2).toList();
    final isMobile = ResponsiveLayout.isMobile(context);
    final sectionGap = isMobile ? AppConstants.sectionGapMobile : AppConstants.sectionGapDesktop;

    return PageScaffold(
      currentPath: '/',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -----------------------------------------------------------
          // 1. SIGNATURE BENTO GRID HERO & SKELETON (mchiu.co.uk layout)
          // -----------------------------------------------------------
          _buildBentoHeroGrid(context),

          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // 2. SELECTED WORK CHAPTER — 2-COLUMN SQUARE BENTO GRID
          // -----------------------------------------------------------
          _buildSelectedWorkSection(context, featuredProjects),

          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // 3. DESIGN APPROACH & THINKING — 3-COLUMN SQUARE BENTO GRID
          // -----------------------------------------------------------
          _buildThinkingSection(context, isMobile),

          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // 4. EXPERIENCE SNAPSHOT — 2-COLUMN BENTO GRID
          // -----------------------------------------------------------
          _buildExperienceSnapshot(context, currentRole, isMobile),

          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // 5. CAPABILITIES SNAPSHOT — 2-COLUMN BENTO GRID
          // -----------------------------------------------------------
          _buildCapabilitiesSnapshot(context, topSkills, isMobile),

          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // 6. CONTACT CTA BENTO
          // -----------------------------------------------------------
          const ContactCTA(),
        ],
      ),
    );
  }

  Widget _buildBentoHeroGrid(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;

        // Desktop Bento Grid: 4-Column Modular System
        if (width >= 1024) {
          return Column(
            children: [
              // Row 1: Hero Bio Card (span 2) + Email Card (span 1) + LinkedIn Card (span 1)
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Expanded(flex: 2, child: HeroBentoCard()),
                    SizedBox(width: 20.0),
                    Expanded(flex: 1, child: EmailBentoCard()),
                    SizedBox(width: 20.0),
                    Expanded(flex: 1, child: LinkedInBentoCard()),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),
              // Row 2: GitHub (span 1) + Twitter (span 1) + Stats Card (span 1) + Location Card (span 1)
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Expanded(flex: 1, child: GithubBentoCard()),
                    SizedBox(width: 20.0),
                    Expanded(flex: 1, child: TwitterBentoCard()),
                    SizedBox(width: 20.0),
                    Expanded(flex: 1, child: ExperienceStatsBentoCard()),
                    SizedBox(width: 20.0),
                    Expanded(flex: 1, child: LocationBentoCard()),
                  ],
                ),
              ),
            ],
          );
        }

        // Tablet Bento Grid: 2-Row Split System
        if (width >= 680) {
          return Column(
            children: [
              const HeroBentoCard(),
              const SizedBox(height: 16.0),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Expanded(child: EmailBentoCard()),
                    SizedBox(width: 16.0),
                    Expanded(child: LinkedInBentoCard()),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Expanded(child: GithubBentoCard()),
                    SizedBox(width: 16.0),
                    Expanded(child: TwitterBentoCard()),
                  ],
                ),
              ),
              const SizedBox(height: 16.0),
              IntrinsicHeight(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: const [
                    Expanded(child: ExperienceStatsBentoCard()),
                    SizedBox(width: 16.0),
                    Expanded(child: LocationBentoCard()),
                  ],
                ),
              ),
            ],
          );
        }

        // Mobile Bento Grid: Single Column Flow
        return Column(
          children: [
            const HeroBentoCard(),
            const SizedBox(height: 14.0),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Expanded(child: EmailBentoCard()),
                  SizedBox(width: 12.0),
                  Expanded(child: LinkedInBentoCard()),
                ],
              ),
            ),
            const SizedBox(height: 14.0),
            IntrinsicHeight(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: const [
                  Expanded(child: GithubBentoCard()),
                  SizedBox(width: 12.0),
                  Expanded(child: TwitterBentoCard()),
                ],
              ),
            ),
            const SizedBox(height: 14.0),
            const ExperienceStatsBentoCard(),
            const SizedBox(height: 14.0),
            const LocationBentoCard(),
          ],
        );
      },
    );
  }

  Widget _buildSelectedWorkSection(
    BuildContext context,
    List<dynamic> featuredProjects,
  ) {
    final isMobile = ResponsiveLayout.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Chapter Section Header with Pill Action
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 16.0,
          runSpacing: 12.0,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 8.0,
                  runSpacing: 4.0,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFE8E4DC),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Text(
                        'Chapter 01',
                        style: AppTheme.sectionIndex.copyWith(
                          fontSize: 11.0,
                          fontWeight: FontWeight.w700,
                          letterSpacing: 0.5,
                          color: AppTheme.foreground,
                        ),
                      ),
                    ),
                    Text(
                      '•  Selected Work',
                      style: AppTheme.sectionIndex.copyWith(
                        fontSize: 11.5,
                        letterSpacing: 0.6,
                        color: AppTheme.foregroundMuted,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Case Studies & Products',
                  style: isMobile ? AppTheme.h2 : AppTheme.chapterHeader,
                ),
              ],
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.go('/work'),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceRaised,
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(color: AppTheme.border, width: 1.0),
                    boxShadow: AppTheme.cardShadow,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'Explore All Work',
                        style: AppTheme.label.copyWith(
                          fontSize: 12.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(width: 6.0),
                      const Icon(Icons.arrow_forward_rounded, size: 14.0),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 28.0),

        // Uniform 2-Column Square Bento Grid (Replaces wide single-column cards)
        LayoutBuilder(
          builder: (context, constraints) {
            final isNarrow = constraints.maxWidth < 768;

            if (isNarrow) {
              return Column(
                children: featuredProjects.asMap().entries.map((entry) {
                  final indexStr = '0${entry.key + 1}';
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: EditorialProjectShowcase(
                      project: entry.value,
                      index: indexStr,
                      isFeatured: entry.key == 0,
                    ),
                  );
                }).toList(),
              );
            }

            // 2-Column Responsive Grid of Square Bento Cards
            final leftProjects = <MapEntry<int, dynamic>>[];
            final rightProjects = <MapEntry<int, dynamic>>[];

            for (var i = 0; i < featuredProjects.length; i++) {
              if (i % 2 == 0) {
                leftProjects.add(MapEntry(i, featuredProjects[i]));
              } else {
                rightProjects.add(MapEntry(i, featuredProjects[i]));
              }
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: leftProjects.map((entry) {
                      final indexStr = '0${entry.key + 1}';
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: EditorialProjectShowcase(
                          project: entry.value,
                          index: indexStr,
                          isFeatured: entry.key == 0,
                        ),
                      );
                    }).toList(),
                  ),
                ),
                const SizedBox(width: 24.0),
                Expanded(
                  child: Column(
                    children: rightProjects.map((entry) {
                      final indexStr = '0${entry.key + 1}';
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24.0),
                        child: EditorialProjectShowcase(
                          project: entry.value,
                          index: indexStr,
                          isFeatured: entry.key == 0,
                        ),
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildThinkingSection(BuildContext context, bool isMobile) {
    final principles = [
      (
        '01',
        'Complex Systems to Intuitive Flows',
        'Real estate and enterprise applications are dense with multistep operations. I design structured information architecture and clear navigation hierarchies that remove operational friction.',
      ),
      (
        '02',
        'Cross-Platform Ecosystem Thinking',
        'From operator-facing SaaS dashboards to on-site agent tools and customer mobile apps, every surface must share a unified design vocabulary and consistent mental model.',
      ),
      (
        '03',
        'Production-Grade Component Systems',
        'I build scalable Figma design systems with strict variants, tokens, and comprehensive documentation to accelerate developer velocity and guarantee visual consistency.',
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 10.0,
          runSpacing: 6.0,
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
              decoration: BoxDecoration(
                color: const Color(0xFFE8E4DC),
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: Text(
                'Perspective',
                style: AppTheme.sectionIndex.copyWith(
                  fontSize: 11.0,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
            ),
            Text(
              '•  Design Approach',
              style: AppTheme.sectionIndex.copyWith(fontSize: 11.5, letterSpacing: 0.6),
            ),
          ],
        ),
        const SizedBox(height: 12.0),
        const Text(
          'How I approach product challenges',
          style: AppTheme.h2,
        ),
        const SizedBox(height: 24.0),

        // 3-Column Uniform Square Bento Grid
        LayoutBuilder(
          builder: (context, constraints) {
            final isNarrow = constraints.maxWidth < 900;
            if (isNarrow) {
              return Column(
                children: principles.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: _buildSquarePrincipleCard(item.$1, item.$2, item.$3),
                  );
                }).toList(),
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: principles.map((item) {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(
                      right: item == principles.last ? 0.0 : 20.0,
                    ),
                    child: _buildSquarePrincipleCard(item.$1, item.$2, item.$3),
                  ),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildSquarePrincipleCard(String num, String title, String body) {
    return BentoCard(
      padding: const EdgeInsets.all(28.0),
      backgroundColor: AppTheme.surfaceRaised,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
            decoration: BoxDecoration(
              color: const Color(0xFFE8E4DC),
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Text(
              num,
              style: AppTheme.sectionIndex.copyWith(
                fontSize: 13.0,
                fontWeight: FontWeight.w700,
                color: AppTheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 18.0),
          Text(
            title,
            style: AppTheme.h3.copyWith(
              fontSize: 18.0,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2,
              color: AppTheme.foreground,
            ),
          ),
          const SizedBox(height: 12.0),
          Text(
            body,
            style: AppTheme.bodySmall.copyWith(
              color: AppTheme.foregroundMuted,
              height: 1.55,
              fontSize: 13.5,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExperienceSnapshot(
    BuildContext context,
    dynamic currentRole,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 12.0,
          runSpacing: 8.0,
          children: [
            Text(
              '02  •  Experience Snapshot',
              style: AppTheme.sectionIndex.copyWith(
                letterSpacing: 0.6,
                fontWeight: FontWeight.w700,
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.go('/experience'),
                child: Text(
                  'Full Timeline →',
                  style: AppTheme.label.copyWith(
                    color: AppTheme.primary,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        ExperienceItem(experience: currentRole),
      ],
    );
  }

  Widget _buildCapabilitiesSnapshot(
    BuildContext context,
    List<dynamic> topSkills,
    bool isMobile,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          alignment: WrapAlignment.spaceBetween,
          crossAxisAlignment: WrapCrossAlignment.center,
          spacing: 12.0,
          runSpacing: 8.0,
          children: [
            Text(
              '03  •  Core Capabilities',
              style: AppTheme.sectionIndex.copyWith(
                letterSpacing: 0.6,
                fontWeight: FontWeight.w700,
              ),
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.go('/capabilities'),
                child: Text(
                  'All Capabilities →',
                  style: AppTheme.label.copyWith(
                    color: AppTheme.primary,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20.0),
        // 2-Column Uniform Bento Layout
        LayoutBuilder(
          builder: (context, constraints) {
            final isNarrow = constraints.maxWidth < 768;
            if (isNarrow) {
              return Column(
                children: topSkills
                    .map((group) => Padding(
                          padding: const EdgeInsets.only(bottom: 16.0),
                          child: SkillGroupCard(skillGroup: group),
                        ))
                    .toList(),
              );
            }

            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: topSkills
                  .map((group) => Expanded(
                        child: Padding(
                          padding: EdgeInsets.only(
                            right: group == topSkills.last ? 0.0 : 20.0,
                          ),
                          child: SkillGroupCard(skillGroup: group),
                        ),
                      ))
                  .toList(),
            );
          },
        ),
      ],
    );
  }
}
