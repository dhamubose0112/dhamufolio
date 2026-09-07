import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../app/app_config.dart';
import '../../core/constants/app_constants.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_theme.dart';
import '../../data/contact/contact_data.dart';
import 'app_navigation_bar.dart';

/// Reusable responsive footer for all pages.
class AppFooter extends StatelessWidget {
  const AppFooter({super.key});

  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveLayout.isMobile(context);
    final horizontalPad = ResponsiveLayout.horizontalPadding(context);

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppTheme.background,
        border: Border(top: BorderSide(color: AppTheme.border, width: 1.0)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPad,
        vertical: 48.0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (isMobile) ...[
                _buildIdentityBlock(),
                const SizedBox(height: 32.0),
                _buildLinksBlock(context),
                const SizedBox(height: 32.0),
                _buildExternalLinksBlock(),
              ] else ...[
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(flex: 3, child: _buildIdentityBlock()),
                    Expanded(flex: 2, child: _buildLinksBlock(context)),
                    Expanded(flex: 2, child: _buildExternalLinksBlock()),
                  ],
                ),
              ],
              const SizedBox(height: 40.0),
              const Divider(),
              const SizedBox(height: 20.0),
              Text(
                '© ${DateTime.now().year} ${AppConfig.designerName}. Designed & built with Flutter Web.',
                style: AppTheme.caption.copyWith(color: AppTheme.foregroundSubtle),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIdentityBlock() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          AppConfig.designerName,
          style: AppTheme.h3,
        ),
        const SizedBox(height: 6.0),
        const Text(
          AppConfig.primaryTitle,
          style: AppTheme.bodySmall,
        ),
        const SizedBox(height: 4.0),
        Text(
          '${AppConfig.currentCompany} • ${AppConfig.currentLocation}',
          style: AppTheme.caption,
        ),
      ],
    );
  }

  Widget _buildLinksBlock(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Navigation', style: AppTheme.label.copyWith(fontSize: 13.0)),
        const SizedBox(height: 12.0),
        ...navigationItems.map((item) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => context.go(item.path),
                child: Text(
                  item.label,
                  style: AppTheme.bodySmall,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  Widget _buildExternalLinksBlock() {
    final contact = ContactData.info;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Connect', style: AppTheme.label.copyWith(fontSize: 13.0)),
        const SizedBox(height: 12.0),
        Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: InkWell(
            onTap: () async {
              final Uri emailUri = Uri(
                scheme: 'mailto',
                path: contact.email,
                queryParameters: {
                  'subject': 'UI/UX & Product Design Inquiry',
                },
              );
              if (await canLaunchUrl(emailUri)) {
                await launchUrl(emailUri);
              }
            },
            child: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              spacing: 4.0,
              children: [
                Text(contact.email, style: AppTheme.bodySmall),
                const Icon(
                  Icons.mail_outline,
                  size: 12.0,
                  color: AppTheme.foregroundMuted,
                ),
              ],
            ),
          ),
        ),
        if (contact.linkedInUrl != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: InkWell(
              onTap: () => _launchUrl(contact.linkedInUrl!),
              child: const Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4.0,
                children: [
                  Text('LinkedIn', style: AppTheme.bodySmall),
                  Icon(
                    Icons.arrow_outward,
                    size: 12.0,
                    color: AppTheme.foregroundMuted,
                  ),
                ],
              ),
            ),
          ),
        if (contact.gitHubUrl != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: InkWell(
              onTap: () => _launchUrl(contact.gitHubUrl!),
              child: const Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4.0,
                children: [
                  Text('GitHub', style: AppTheme.bodySmall),
                  Icon(
                    Icons.arrow_outward,
                    size: 12.0,
                    color: AppTheme.foregroundMuted,
                  ),
                ],
              ),
            ),
          ),
        if (contact.twitterUrl != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8.0),
            child: InkWell(
              onTap: () => _launchUrl(contact.twitterUrl!),
              child: const Wrap(
                crossAxisAlignment: WrapCrossAlignment.center,
                spacing: 4.0,
                children: [
                  Text('Twitter / X', style: AppTheme.bodySmall),
                  Icon(
                    Icons.arrow_outward,
                    size: 12.0,
                    color: AppTheme.foregroundMuted,
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
