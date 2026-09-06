import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../app/app_config.dart';
import '../../core/constants/app_constants.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_theme.dart';
import '../../shared/components/bento_card.dart';
import '../../shared/components/contact_cta.dart';
import '../../shared/components/editorial_section_header.dart';
import '../../shared/layout/page_scaffold.dart';

/// Editorial About page structured around uniform square/modular Bento Cards:
/// 01 — ABOUT (Introductory heading)
/// 02 — PROFILE (Portrait Bento Card + Bio Bento Card)
/// 03 — HOW I THINK ABOUT DESIGN (3-Column Grid of Square Principle Cards)
/// 04 — CREATIVE DISCIPLINES (2-Column Grid of Square Discipline Cards)
/// 05 — CURRENT ROLE (Role Bento Card)
/// 06 — TOOLS & WORKING AREAS (Grid of Tool Cards)
/// 07 — CONTACT CTA
class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final sectionGap = isMobile ? AppConstants.sectionGapMobile : AppConstants.sectionGapDesktop;

    return PageScaffold(
      currentPath: '/about',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -----------------------------------------------------------
          // 01 — ABOUT (Introductory heading)
          // -----------------------------------------------------------
          const EditorialSectionHeader(
            index: '01',
            title: 'About',
          ),
          const SizedBox(height: 16.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 860.0),
            child: Text(
              'Designing products that make complex workflows easier to understand and use.',
              style: isMobile ? AppTheme.display : AppTheme.editorialHero,
            ),
          ),
          const SizedBox(height: 36.0),

          // -----------------------------------------------------------
          // 02 — PROFILE (Uniform Bento Cards with dhamu_color_pop.png)
          // -----------------------------------------------------------
          _buildProfileSection(context, isMobile),

          SizedBox(height: sectionGap),
          const Divider(),
          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // 03 — HOW I THINK ABOUT DESIGN (3-Column Square Bento Grid)
          // -----------------------------------------------------------
          _buildHowIThinkSection(context, isMobile),

          SizedBox(height: sectionGap),
          const Divider(),
          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // 04 — CREATIVE DISCIPLINES (2-Column Square Bento Grid)
          // -----------------------------------------------------------
          _buildCreativeDisciplinesSection(isMobile),

          SizedBox(height: sectionGap),
          const Divider(),
          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // 05 — CURRENT ROLE & 06 — TOOLS (Uniform Bento Layout)
          // -----------------------------------------------------------
          _buildCurrentRoleSection(context, isMobile),

          SizedBox(height: sectionGap),
          const Divider(),
          SizedBox(height: sectionGap),

          _buildToolsWorkingAreasSection(isMobile),

          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // 07 — CONTACT CTA
          // -----------------------------------------------------------
          const ContactCTA(),
        ],
      ),
    );
  }

  // 02 — PROFILE
  Widget _buildProfileSection(BuildContext context, bool isMobile) {
    final portraitCard = BentoCard(
      padding: const EdgeInsets.all(16.0),
      backgroundColor: AppTheme.surfaceRaised,
      child: Container(
        height: isMobile ? 320.0 : 380.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          color: const Color(0xFFF4F2EC),
        ),
        clipBehavior: Clip.antiAlias,
        child: Semantics(
          label: '${AppConfig.designerName} portrait photograph',
          image: true,
          child: Image.asset(
            'assets/images/dhamu_color_pop.png',
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => Center(
              child: Text(
                'DB',
                style: TextStyle(
                  fontSize: 48.0,
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primary,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final bioCard = BentoCard(
      padding: EdgeInsets.all(isMobile ? 24.0 : 36.0),
      backgroundColor: AppTheme.surfaceRaised,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
            decoration: BoxDecoration(
              color: const Color(0xFFE8E4DC),
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Text(
              'Profile',
              style: AppTheme.sectionIndex.copyWith(
                fontSize: 11.0,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.5,
              ),
            ),
          ),
          const SizedBox(height: 18.0),
          Text(
            'I am ${AppConfig.designerName}, a ${AppConfig.primaryTitle} with ${AppConfig.experienceYears} of experience designing user-centric interfaces and digital products.',
            style: AppTheme.h3.copyWith(
              fontWeight: FontWeight.w700,
              height: 1.45,
            ),
          ),
          const SizedBox(height: 14.0),
          Text(
            'My experience spans SaaS applications, enterprise products, real estate platforms, and customer-facing mobile and web experiences. I focus on deconstructing intricate business operations into clear, structured, and usable interfaces.',
            style: AppTheme.body.copyWith(
              color: AppTheme.foregroundMuted,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 14.0),
          Text(
            'Throughout my work, I create user flows, wireframes, and high-fidelity interactive prototypes, build reusable component libraries, conduct foundational user research, and collaborate closely with product managers and engineering teams.',
            style: AppTheme.body.copyWith(
              color: AppTheme.foregroundMuted,
              height: 1.6,
            ),
          ),
        ],
      ),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const EditorialSectionHeader(
          index: '02',
          title: 'Profile',
        ),
        const SizedBox(height: 24.0),
        if (isMobile)
          Column(
            children: [
              portraitCard,
              const SizedBox(height: 16.0),
              bioCard,
            ],
          )
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 320.0,
                child: portraitCard,
              ),
              const SizedBox(width: 24.0),
              Expanded(child: bioCard),
            ],
          ),
      ],
    );
  }

  // 03 — HOW I THINK ABOUT DESIGN (3-Column Square Bento Grid)
  Widget _buildHowIThinkSection(BuildContext context, bool isMobile) {
    final principles = [
      (
        '01',
        'Understanding the Problem',
        'Before drawing interfaces, I clarify user goals and business constraints to make sure design decisions address actual user friction.'
      ),
      (
        '02',
        'Simplifying Workflows',
        'Enterprise and SaaS systems often have deep information architecture. I structure flows to minimize cognitive load and make multi-step tasks intuitive.'
      ),
      (
        '03',
        'User-Perspective Thinking',
        'Design choices should always account for the real operational context of the user, whether they are an enterprise operator or a retail customer.'
      ),
      (
        '04',
        'Consistency & Scalability',
        'Using modular component thinking and design systems to ensure consistency across responsive web and mobile touchpoints.'
      ),
      (
        '05',
        'Responsive by Default',
        'Interfaces must function reliably across diverse device viewports, preserving hierarchy, thumb-reach zones, and interaction clarity.'
      ),
      (
        '06',
        'Collaborative Alignment',
        'Working closely with product managers and engineering teams to validate feasibility, streamline handoff, and deliver cohesive products.'
      ),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const EditorialSectionHeader(
          index: '03',
          title: 'How I Think About Design',
        ),
        const SizedBox(height: 16.0),
        const Text(
          'Practical Principles Grounded in Product Work',
          style: AppTheme.h2,
        ),
        const SizedBox(height: 28.0),

        LayoutBuilder(
          builder: (context, constraints) {
            final isNarrow = constraints.maxWidth < 900;
            if (isNarrow) {
              return Column(
                children: principles.map((item) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16.0),
                    child: _buildPrincipleBentoCard(item.$1, item.$2, item.$3),
                  );
                }).toList(),
              );
            }

            // 3-Column Grid of Square Bento Cards
            return Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildPrincipleBentoCard(principles[0].$1, principles[0].$2, principles[0].$3)),
                    const SizedBox(width: 20.0),
                    Expanded(child: _buildPrincipleBentoCard(principles[1].$1, principles[1].$2, principles[1].$3)),
                    const SizedBox(width: 20.0),
                    Expanded(child: _buildPrincipleBentoCard(principles[2].$1, principles[2].$2, principles[2].$3)),
                  ],
                ),
                const SizedBox(height: 20.0),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(child: _buildPrincipleBentoCard(principles[3].$1, principles[3].$2, principles[3].$3)),
                    const SizedBox(width: 20.0),
                    Expanded(child: _buildPrincipleBentoCard(principles[4].$1, principles[4].$2, principles[4].$3)),
                    const SizedBox(width: 20.0),
                    Expanded(child: _buildPrincipleBentoCard(principles[5].$1, principles[5].$2, principles[5].$3)),
                  ],
                ),
              ],
            );
          },
        ),
      ],
    );
  }

  Widget _buildPrincipleBentoCard(String num, String title, String description) {
    return BentoCard(
      padding: const EdgeInsets.all(28.0),
      backgroundColor: AppTheme.surfaceRaised,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
            decoration: BoxDecoration(
              color: const Color(0xFFE8E4DC),
              borderRadius: BorderRadius.circular(100.0),
            ),
            child: Text(
              num,
              style: AppTheme.sectionIndex.copyWith(
                fontSize: 12.0,
                fontWeight: FontWeight.w700,
                color: AppTheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          Text(
            title,
            style: AppTheme.h3.copyWith(
              fontSize: 17.5,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.2,
            ),
          ),
          const SizedBox(height: 10.0),
          Text(
            description,
            style: AppTheme.bodySmall.copyWith(
              color: AppTheme.foregroundMuted,
              height: 1.55,
              fontSize: 13.0,
            ),
          ),
        ],
      ),
    );
  }

  // 04 — CREATIVE DISCIPLINES (2-Column Square Bento Grid)
  Widget _buildCreativeDisciplinesSection(bool isMobile) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const EditorialSectionHeader(
          index: '04',
          title: 'Creative Disciplines',
        ),
        const SizedBox(height: 16.0),
        const Text(
          'Supporting Creative Capabilities',
          style: AppTheme.h2,
        ),
        const SizedBox(height: 12.0),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 720.0),
          child: Text(
            'Complementary creative backgrounds that support visual storytelling, presentation craft, and brand communication.',
            style: AppTheme.body.copyWith(color: AppTheme.foregroundMuted),
          ),
        ),
        const SizedBox(height: 28.0),
        if (isMobile)
          Column(
            children: [
              _buildDisciplineBentoCard(
                'Graphic Design & Branding',
                'Visual communication, brand collateral, marketing presentations, and landing design.',
                Icons.palette_outlined,
              ),
              const SizedBox(height: 16.0),
              _buildDisciplineBentoCard(
                'Video Editing',
                'Promotional video production, digital platform content, narrative pacing, and motion accents.',
                Icons.videocam_outlined,
              ),
            ],
          )
        else
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: _buildDisciplineBentoCard(
                  'Graphic Design & Branding',
                  'Visual communication, brand collateral, marketing presentations, and campaign/landing design.',
                  Icons.palette_outlined,
                ),
              ),
              const SizedBox(width: 20.0),
              Expanded(
                child: _buildDisciplineBentoCard(
                  'Video Editing',
                  'Promotional video production, short-form digital platform content, narrative pacing, and motion graphic accents.',
                  Icons.videocam_outlined,
                ),
              ),
            ],
          ),
      ],
    );
  }

  Widget _buildDisciplineBentoCard(String title, String description, IconData icon) {
    return BentoCard(
      padding: const EdgeInsets.all(28.0),
      backgroundColor: AppTheme.surfaceRaised,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 44.0,
            height: 44.0,
            decoration: BoxDecoration(
              color: const Color(0xFFF2EFEB),
              borderRadius: BorderRadius.circular(14.0),
              border: Border.all(color: AppTheme.border),
            ),
            child: Icon(icon, size: 22.0, color: AppTheme.primary),
          ),
          const SizedBox(height: 18.0),
          Text(title, style: AppTheme.label.copyWith(fontSize: 13.0, fontWeight: FontWeight.w700)),
          const SizedBox(height: 10.0),
          Text(
            description,
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

  // 05 — CURRENT ROLE
  Widget _buildCurrentRoleSection(BuildContext context, bool isMobile) {
    return BentoCard(
      padding: EdgeInsets.all(isMobile ? 24.0 : 36.0),
      backgroundColor: AppTheme.surfaceRaised,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const EditorialSectionHeader(
            index: '05',
            title: 'Current Role',
          ),
          const SizedBox(height: 16.0),
          Text(
            'Ishtaka Buildmetrix Private Limited',
            style: AppTheme.h2.copyWith(fontSize: isMobile ? 22.0 : 26.0),
          ),
          const SizedBox(height: 10.0),
          Wrap(
            spacing: 12.0,
            runSpacing: 6.0,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFE8E4DC),
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: const Text('UI/UX Designer', style: AppTheme.label),
              ),
              const Text('•', style: AppTheme.caption),
              const Text('May 2024 – Present', style: AppTheme.caption),
              const Text('•', style: AppTheme.caption),
              const Text('Bengaluru, India', style: AppTheme.caption),
            ],
          ),
          const SizedBox(height: 18.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760.0),
            child: Text(
              'Designing intuitive, responsive interfaces for real estate SaaS products, CRM systems, customer-facing portals, and partner platforms. Responsibilities include building scalable design systems, conducting user research, prototyping workflows, and collaborating with engineering teams.',
              style: AppTheme.body.copyWith(
                color: AppTheme.foregroundMuted,
                height: 1.6,
              ),
            ),
          ),
          const SizedBox(height: 24.0),
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () => context.go('/experience'),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                decoration: BoxDecoration(
                  color: AppTheme.surfaceRaised,
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(color: AppTheme.borderStrong),
                  boxShadow: AppTheme.cardShadow,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(isMobile ? 'View Experience' : 'View Full Experience Timeline', style: AppTheme.label),
                    const SizedBox(width: 8.0),
                    const Icon(Icons.arrow_forward_rounded, size: 14.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // 06 — TOOLS & WORKING AREAS (Grid of Square Bento Cards)
  Widget _buildToolsWorkingAreasSection(bool isMobile) {
    final areas = [
      ('Figma & FigJam', 'Interface design, auto-layout tokens, interactive prototyping.', Icons.design_services_outlined),
      ('Design Systems', 'Reusable component libraries, layout grids, token architecture.', Icons.layers_outlined),
      ('User Research & IA', 'User flows, wireframing, information architecture, reviews.', Icons.psychology_outlined),
      ('Flutter & Prototyping', 'Interactive frontend prototyping and design-to-code alignment.', Icons.code_rounded),
      ('AI Workflows', 'Accelerating exploration, research synthesis, and rapid ideation.', Icons.auto_awesome_outlined),
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const EditorialSectionHeader(
          index: '06',
          title: 'Tools & Working Areas',
        ),
        const SizedBox(height: 16.0),
        const Text(
          'Daily Tooling & Practical Focus',
          style: AppTheme.h2,
        ),
        const SizedBox(height: 24.0),
        LayoutBuilder(
          builder: (context, constraints) {
            final isNarrow = constraints.maxWidth < 768;
            if (isNarrow) {
              return Column(
                children: areas.map((a) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 14.0),
                    child: _buildToolBentoCard(a.$1, a.$2, a.$3),
                  );
                }).toList(),
              );
            }

            return Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              children: areas.map((a) {
                final cardWidth = (constraints.maxWidth - (2 * 16.0)) / 3;
                return SizedBox(
                  width: cardWidth > 240 ? cardWidth : (constraints.maxWidth - 16.0) / 2,
                  child: _buildToolBentoCard(a.$1, a.$2, a.$3),
                );
              }).toList(),
            );
          },
        ),
      ],
    );
  }

  Widget _buildToolBentoCard(String title, String desc, IconData icon) {
    return BentoCard(
      padding: const EdgeInsets.all(22.0),
      backgroundColor: AppTheme.surfaceRaised,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 22.0, color: AppTheme.primary),
          const SizedBox(height: 14.0),
          Text(title, style: AppTheme.h3.copyWith(fontSize: 16.0, fontWeight: FontWeight.w700)),
          const SizedBox(height: 6.0),
          Text(
            desc,
            style: AppTheme.caption.copyWith(
              color: AppTheme.foregroundMuted,
              height: 1.45,
            ),
          ),
        ],
      ),
    );
  }
}
