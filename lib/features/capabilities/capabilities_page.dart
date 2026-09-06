import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_constants.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_theme.dart';
import '../../data/skills/skills_data.dart';
import '../../models/skill_category.dart';
import '../../shared/components/bento_card.dart';
import '../../shared/components/contact_cta.dart';
import '../../shared/components/editorial_section_header.dart';
import '../../shared/components/skill_group_card.dart';
import '../../shared/layout/page_scaffold.dart';

/// Capabilities page formatted uniformly in 2-column square/modular Bento Cards.
class CapabilitiesPage extends StatelessWidget {
  const CapabilitiesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final sectionGap = isMobile ? AppConstants.sectionGapMobile : AppConstants.sectionGapDesktop;
    final primaryCategories = SkillsData.primaryCategories;
    final supportingCategories = SkillsData.supportingCategories;

    return PageScaffold(
      currentPath: '/capabilities',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -----------------------------------------------------------
          // 01 — CAPABILITIES (Editorial header)
          // -----------------------------------------------------------
          const EditorialSectionHeader(
            index: '01',
            title: 'Capabilities',
          ),
          const SizedBox(height: 16.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 860.0),
            child: Text(
              'Core Product Design & Supporting Capabilities',
              style: isMobile ? AppTheme.display : AppTheme.editorialHero,
            ),
          ),
          const SizedBox(height: 20.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760.0),
            child: Text(
              'UI/UX and Product Design represent my core professional discipline. Supporting technical workflows, creative craft, and AI tooling facilitate rapid interactive prototyping and seamless engineering collaboration.',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.foregroundMuted,
                height: 1.6,
              ),
            ),
          ),

          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // PRIMARY DESIGN SPECIALIZATIONS (2-COLUMN SQUARE BENTO GRID)
          // -----------------------------------------------------------
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12.0,
            children: [
              Text('02 /', style: AppTheme.sectionIndex.copyWith(fontSize: 13.0, fontWeight: FontWeight.w700)),
              Text('Primary Design Specializations', style: isMobile ? AppTheme.h2 : AppTheme.h1.copyWith(fontSize: 26.0)),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            'Core product disciplines applied across production SaaS workflows, mobile applications, and scalable design systems.',
            style: AppTheme.body.copyWith(
              color: AppTheme.foregroundMuted,
            ),
          ),
          const SizedBox(height: 28.0),

          _buildCapabilitiesGrid(primaryCategories, isMobile),

          SizedBox(height: sectionGap),
          const Divider(),
          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // SUPPORTING DISCIPLINES & WORKFLOWS (2-COLUMN GRID)
          // -----------------------------------------------------------
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12.0,
            children: [
              Text('03 /', style: AppTheme.sectionIndex.copyWith(fontSize: 13.0, fontWeight: FontWeight.w700)),
              Text('Supporting Disciplines & Dev Workflows', style: isMobile ? AppTheme.h2 : AppTheme.h1.copyWith(fontSize: 26.0)),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            'Complementary frontend, AI-assisted workflows, branding, and video capabilities that enrich product craft and communication.',
            style: AppTheme.body.copyWith(
              color: AppTheme.foregroundMuted,
            ),
          ),
          const SizedBox(height: 28.0),

          _buildCapabilitiesGrid(supportingCategories, isMobile),

          SizedBox(height: sectionGap),
          const Divider(),
          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // SELECTED WORK CTA (Uniform Bento Card)
          // -----------------------------------------------------------
          BentoCard(
            padding: EdgeInsets.all(isMobile ? 24.0 : 36.0),
            backgroundColor: AppTheme.surfaceRaised,
            child: isMobile
                ? Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Applied in Practice', style: AppTheme.sectionIndex),
                      const SizedBox(height: 8.0),
                      const Text('See These Capabilities in Production', style: AppTheme.h2),
                      const SizedBox(height: 8.0),
                      Text(
                        'Browse enterprise and customer-facing case studies demonstrating real-world execution.',
                        style: AppTheme.bodySmall.copyWith(color: AppTheme.foregroundMuted),
                      ),
                      const SizedBox(height: 20.0),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => context.go('/work'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                            decoration: BoxDecoration(
                              color: AppTheme.primary,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text('Explore Work', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                                SizedBox(width: 8.0),
                                Icon(Icons.arrow_forward_rounded, size: 14.0, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                : Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text('Applied in Practice', style: AppTheme.sectionIndex),
                            const SizedBox(height: 8.0),
                            const Text('See These Capabilities in Production', style: AppTheme.h2),
                            const SizedBox(height: 6.0),
                            Text(
                              'Browse enterprise and customer-facing case studies demonstrating real-world execution.',
                              style: AppTheme.bodySmall.copyWith(color: AppTheme.foregroundMuted),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 24.0),
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => context.go('/work'),
                          child: Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                            decoration: BoxDecoration(
                              color: AppTheme.primary,
                              borderRadius: BorderRadius.circular(100.0),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: const [
                                Text('Explore Work', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                                SizedBox(width: 8.0),
                                Icon(Icons.arrow_forward_rounded, size: 14.0, color: Colors.white),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
          ),

          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // CONTACT CTA
          // -----------------------------------------------------------
          const ContactCTA(),
        ],
      ),
    );
  }

  Widget _buildCapabilitiesGrid(List<SkillCategory> categories, bool isMobile) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 768;

        if (isNarrow) {
          return Column(
            children: categories.map((cat) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: SkillGroupCard(category: cat),
              );
            }).toList(),
          );
        }

        // 2-Column Balanced Bento Grid
        final leftList = <SkillCategory>[];
        final rightList = <SkillCategory>[];

        for (var i = 0; i < categories.length; i++) {
          if (i % 2 == 0) {
            leftList.add(categories[i]);
          } else {
            rightList.add(categories[i]);
          }
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: leftList.map((cat) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: SkillGroupCard(category: cat),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Column(
                children: rightList.map((cat) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: SkillGroupCard(category: cat),
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
