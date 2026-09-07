import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_constants.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_theme.dart';
import '../../data/experience/experience_data.dart';
import '../../models/experience.dart';
import '../../shared/components/contact_cta.dart';
import '../../shared/components/editorial_section_header.dart';
import '../../shared/components/experience_item.dart';
import '../../shared/layout/page_scaffold.dart';

/// Experience page structured around verified career history:
/// Displayed in a uniform 2-column square/modular Bento Grid.
class ExperiencePage extends StatelessWidget {
  const ExperiencePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final sectionGap = isMobile ? AppConstants.sectionGapMobile : AppConstants.sectionGapDesktop;
    final productExperiences = ExperienceData.productDesignExperiences;
    final creativeExperiences = ExperienceData.creativeDomainExperiences;

    return PageScaffold(
      currentPath: '/experience',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -----------------------------------------------------------
          // 01 — EXPERIENCE (Editorial heading)
          // -----------------------------------------------------------
          const EditorialSectionHeader(
            index: '01',
            title: 'Experience',
          ),
          const SizedBox(height: 16.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 860.0),
            child: Text(
              'Professional Experience & Design Track Record',
              style: isMobile ? AppTheme.display : AppTheme.editorialHero,
            ),
          ),
          const SizedBox(height: 20.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760.0),
            child: Text(
              'A verified record of full-time product design work and supporting creative disciplines, derived strictly from confirmed resume data.',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.foregroundMuted,
                height: 1.6,
              ),
            ),
          ),

          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // 02 — CURRENT EXPERIENCE (2-COLUMN SQUARE BENTO GRID)
          // -----------------------------------------------------------
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12.0,
            children: [
              Text('02 /', style: AppTheme.sectionIndex.copyWith(fontSize: 13.0, fontWeight: FontWeight.w700)),
              Text('Current Experience', style: isMobile ? AppTheme.h2 : AppTheme.h1.copyWith(fontSize: 26.0)),
              Text(
                '(${productExperiences.length})',
                style: AppTheme.caption.copyWith(
                  color: AppTheme.foregroundSubtle,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            'Full-time product design roles designing SaaS applications, customer platforms, and partner ecosystems.',
            style: AppTheme.body.copyWith(
              color: AppTheme.foregroundMuted,
            ),
          ),
          const SizedBox(height: 28.0),

          // 2-Column Responsive Bento Grid for Product Experience
          _buildExperienceBentoGrid(productExperiences, isMobile),

          SizedBox(height: sectionGap / 2),
          const Divider(),
          SizedBox(height: sectionGap / 2),

          // -----------------------------------------------------------
          // 03 — CREATIVE DOMAIN EXPERIENCE (2-COLUMN GRID)
          // -----------------------------------------------------------
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12.0,
            children: [
              Text('03 /', style: AppTheme.sectionIndex.copyWith(fontSize: 13.0, fontWeight: FontWeight.w700)),
              Text('Creative & Multimedia Roles', style: isMobile ? AppTheme.h2 : AppTheme.h1.copyWith(fontSize: 26.0)),
              Text(
                '(${creativeExperiences.length})',
                style: AppTheme.caption.copyWith(
                  color: AppTheme.foregroundSubtle,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          Text(
            'Graphic design, video production, and visual communication background that enriches product storytelling and craft.',
            style: AppTheme.body.copyWith(
              color: AppTheme.foregroundMuted,
            ),
          ),
          const SizedBox(height: 28.0),

          // 2-Column Responsive Bento Grid for Creative Experience
          _buildExperienceBentoGrid(creativeExperiences, isMobile),

          SizedBox(height: sectionGap / 2),
          const Divider(),
          SizedBox(height: sectionGap / 2),

          // -----------------------------------------------------------
          // 04 — PROFESSIONAL FOCUS & VIEW SELECTED WORK
          // -----------------------------------------------------------
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12.0,
            children: [
              Text('04 /', style: AppTheme.sectionIndex.copyWith(fontSize: 13.0, fontWeight: FontWeight.w700)),
              Text('Professional Focus', style: isMobile ? AppTheme.h2 : AppTheme.h1.copyWith(fontSize: 26.0)),
            ],
          ),
          const SizedBox(height: 20.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: [
              'Product Design',
              'UX / UI',
              'Enterprise SaaS',
              'Real Estate Products',
              'Design Systems',
              'Responsive Experiences',
              'Prototyping',
              'Product Collaboration',
            ].map((tag) => Container(
              padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
              decoration: BoxDecoration(
                color: AppTheme.surfaceRaised,
                borderRadius: BorderRadius.circular(100.0),
                border: Border.all(color: AppTheme.border),
                boxShadow: AppTheme.cardShadow,
              ),
              child: Text(tag, style: AppTheme.label.copyWith(fontSize: 12.0)),
            )).toList(),
          ),
          const SizedBox(height: 28.0),
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
                    Text('View Selected Work', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700)),
                    SizedBox(width: 8.0),
                    Icon(Icons.arrow_forward_rounded, size: 14.0, color: Colors.white),
                  ],
                ),
              ),
            ),
          ),

          SizedBox(height: sectionGap),
          const ContactCTA(),
        ],
      ),
    );
  }

  Widget _buildExperienceBentoGrid(List<Experience> list, bool isMobile) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isNarrow = constraints.maxWidth < 768;

        if (isNarrow || list.length == 1) {
          return Column(
            children: list.map((exp) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: ExperienceItemWidget(experience: exp),
              );
            }).toList(),
          );
        }

        // 2-Column Balanced Grid
        final leftList = <Experience>[];
        final rightList = <Experience>[];

        for (var i = 0; i < list.length; i++) {
          if (i % 2 == 0) {
            leftList.add(list[i]);
          } else {
            rightList.add(list[i]);
          }
        }

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: leftList.map((exp) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ExperienceItemWidget(experience: exp),
                  );
                }).toList(),
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Column(
                children: rightList.map((exp) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: ExperienceItemWidget(experience: exp),
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
