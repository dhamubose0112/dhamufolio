import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_constants.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_theme.dart';
import '../../data/contact/contact_data.dart';
import '../../shared/components/bento_card.dart';
import '../../shared/components/editorial_section_header.dart';
import '../../shared/components/primary_button.dart';
import '../../shared/layout/page_scaffold.dart';

/// Contact page formatted uniformly with modular Square Bento Cards.
class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: ContactData.info.email,
      queryParameters: {
        'subject': 'UI/UX & Product Design Inquiry',
      },
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final contact = ContactData.info;
    final isMobile = ResponsiveLayout.isMobile(context);
    final sectionGap = isMobile ? AppConstants.sectionGapMobile : AppConstants.sectionGapDesktop;

    return PageScaffold(
      currentPath: '/contact',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // -----------------------------------------------------------
          // 01 — CONTACT
          // -----------------------------------------------------------
          const EditorialSectionHeader(
            index: '01',
            title: 'Contact',
          ),
          const SizedBox(height: 16.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 860.0),
            child: Text(
              'Let\'s talk about a product, problem, or opportunity.',
              style: isMobile ? AppTheme.display : AppTheme.editorialHero,
            ),
          ),
          const SizedBox(height: 20.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 760.0),
            child: Text(
              'Open to discussing full-time Product Design and UI/UX opportunities, as well as selected freelance collaborations.',
              style: AppTheme.bodyLarge.copyWith(
                color: AppTheme.foregroundMuted,
                height: 1.6,
              ),
            ),
          ),

          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // 02 — PRIMARY INQUIRY ACTION CARD (BentoCard)
          // -----------------------------------------------------------
          BentoCard(
            padding: EdgeInsets.all(isMobile ? 24.0 : 36.0),
            backgroundColor: AppTheme.surfaceRaised,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 8.0,
                      height: 8.0,
                      decoration: const BoxDecoration(
                        gradient: AppTheme.brandGradient,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    const Flexible(
                      child: Text(
                        'Direct Inquiry & Collaboration',
                        style: AppTheme.sectionIndex,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16.0),
                const Text(
                  'Reach Out via Email',
                  style: AppTheme.h2,
                ),
                const SizedBox(height: 10.0),
                Text(
                  'Based in ${contact.location}. Open to discussing design leadership roles, product challenges, and enterprise design systems.',
                  style: AppTheme.body.copyWith(
                    color: AppTheme.foregroundMuted,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 24.0),
                PrimaryButton(
                  label: 'Email Dhamu',
                  icon: Icons.mail_outline_rounded,
                  onPressed: _launchEmail,
                ),
              ],
            ),
          ),

          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // 03 — CONTACT POINTS (4 SQUARE BENTO CARDS GRID)
          // -----------------------------------------------------------
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12.0,
            children: [
              Text('03 /', style: AppTheme.sectionIndex.copyWith(fontSize: 13.0, fontWeight: FontWeight.w700)),
              Text('Connect & Channels', style: isMobile ? AppTheme.h2 : AppTheme.h1.copyWith(fontSize: 26.0)),
            ],
          ),
          const SizedBox(height: 24.0),

          LayoutBuilder(
            builder: (context, constraints) {
              final isNarrow = constraints.maxWidth < 768;

              if (isNarrow) {
                return Column(
                  children: [
                    _buildInfoBentoCard(
                      title: 'Email',
                      value: contact.email,
                      actionLabel: 'Send Email',
                      iconAsset: 'assets/icons/gmail_icon.png',
                      onTap: _launchEmail,
                    ),
                    const SizedBox(height: 16.0),
                    _buildInfoBentoCard(
                      title: 'LinkedIn',
                      value: 'dhamubose',
                      actionLabel: 'View Profile',
                      iconAsset: 'assets/icons/linkedin_icon.png',
                      onTap: contact.linkedInUrl != null
                          ? () => _launchUrl(contact.linkedInUrl!)
                          : null,
                    ),
                    const SizedBox(height: 16.0),
                    _buildInfoBentoCard(
                      title: 'GitHub',
                      value: 'dhamubose',
                      actionLabel: 'View Repositories',
                      iconAsset: 'assets/icons/github_icon.png',
                      onTap: contact.gitHubUrl != null
                          ? () => _launchUrl(contact.gitHubUrl!)
                          : null,
                    ),
                    const SizedBox(height: 16.0),
                    _buildInfoBentoCard(
                      title: 'Location',
                      value: contact.location,
                      actionLabel: 'India',
                      iconAsset: 'assets/icons/googlemap_icon.png',
                      onTap: null,
                    ),
                  ],
                );
              }

              // 2x2 Grid of Square Bento Cards
              return Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoBentoCard(
                          title: 'Email',
                          value: contact.email,
                          actionLabel: 'Send Email',
                          iconAsset: 'assets/icons/gmail_icon.png',
                          onTap: _launchEmail,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: _buildInfoBentoCard(
                          title: 'LinkedIn',
                          value: 'dhamubose',
                          actionLabel: 'View Profile',
                          iconAsset: 'assets/icons/linkedin_icon.png',
                          onTap: contact.linkedInUrl != null
                              ? () => _launchUrl(contact.linkedInUrl!)
                              : null,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    children: [
                      Expanded(
                        child: _buildInfoBentoCard(
                          title: 'GitHub',
                          value: 'dhamubose',
                          actionLabel: 'View Repositories',
                          iconAsset: 'assets/icons/github_icon.png',
                          onTap: contact.gitHubUrl != null
                              ? () => _launchUrl(contact.gitHubUrl!)
                              : null,
                        ),
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: _buildInfoBentoCard(
                          title: 'Location',
                          value: contact.location,
                          actionLabel: 'India',
                          iconAsset: 'assets/icons/googlemap_icon.png',
                          onTap: null,
                        ),
                      ),
                    ],
                  ),
                ],
              );
            },
          ),

          SizedBox(height: sectionGap),
          const Divider(),
          SizedBox(height: sectionGap),

          // -----------------------------------------------------------
          // 04 — CLOSING NOTE & RETURN NAVIGATION
          // -----------------------------------------------------------
          BentoCard(
            padding: EdgeInsets.all(isMobile ? 24.0 : 36.0),
            backgroundColor: AppTheme.surfaceRaised,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Looking forward to thoughtful discussions about design systems, interface architecture, and product problems.',
                  style: AppTheme.bodyLarge.copyWith(
                    color: AppTheme.foreground,
                    height: 1.6,
                  ),
                ),
                const SizedBox(height: 24.0),
                Wrap(
                  spacing: 14.0,
                  runSpacing: 10.0,
                  children: [
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
                          child: const Text('Explore Work', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12.0)),
                        ),
                      ),
                    ),
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => context.go('/about'),
                        child: Container(
                          padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF2EFEB),
                            borderRadius: BorderRadius.circular(100.0),
                            border: Border.all(color: AppTheme.border),
                          ),
                          child: const Text('Read About', style: TextStyle(color: AppTheme.foreground, fontWeight: FontWeight.w700, fontSize: 12.0)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoBentoCard({
    required String title,
    required String value,
    required String actionLabel,
    required String iconAsset,
    required VoidCallback? onTap,
  }) {
    return BentoCard(
      padding: const EdgeInsets.all(24.0),
      backgroundColor: AppTheme.surfaceRaised,
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: AppTheme.sectionIndex.copyWith(fontSize: 11.0)),
              Image.asset(
                iconAsset,
                width: 24.0,
                height: 24.0,
                fit: BoxFit.contain,
              ),
            ],
          ),
          const SizedBox(height: 14.0),
          Text(
            value,
            style: AppTheme.h3.copyWith(fontSize: 17.0, fontWeight: FontWeight.w700),
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 16.0),
          if (onTap != null)
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2EFEB),
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(color: AppTheme.border),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        actionLabel,
                        style: AppTheme.caption.copyWith(
                          color: AppTheme.foreground,
                          fontWeight: FontWeight.w700,
                          fontSize: 11.5,
                        ),
                      ),
                      const SizedBox(width: 4.0),
                      const Icon(Icons.arrow_outward, size: 12.0, color: AppTheme.foreground),
                    ],
                  ),
                ),
              ),
            )
          else
            Text(
              actionLabel,
              style: AppTheme.caption.copyWith(color: AppTheme.foregroundSubtle),
            ),
        ],
      ),
    );
  }
}
