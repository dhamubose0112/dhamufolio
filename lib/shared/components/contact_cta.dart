import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/theme/app_theme.dart';
import '../../data/contact/contact_data.dart';
import 'bento_card.dart';
import 'primary_button.dart';

/// Bento-styled contact CTA card matching mchiu.co.uk aesthetics.
class ContactCTA extends StatelessWidget {
  const ContactCTA({super.key});

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: ContactData.info.email,
      queryParameters: {
        'subject': 'Product Design / UI/UX Inquiry',
      },
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BentoCard(
      width: double.infinity,
      padding: EdgeInsets.all(MediaQuery.of(context).size.width < 600 ? 24.0 : 40.0),
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
              Flexible(
                child: Text(
                  'Direct Inquiry & Collaboration',
                  style: AppTheme.caption.copyWith(
                    letterSpacing: 0.5,
                    fontWeight: FontWeight.w700,
                    color: AppTheme.foregroundMuted,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          const Text(
            'Interested in discussing a product design role or collaboration?',
            style: AppTheme.h2,
          ),
          const SizedBox(height: 12.0),
          Text(
            'Based in ${ContactData.info.location}. Open to discuss design opportunities, product challenges, and design leadership roles.',
            style: AppTheme.body.copyWith(
              color: AppTheme.foregroundMuted,
              height: 1.6,
            ),
          ),
          const SizedBox(height: 28.0),
          Wrap(
            spacing: 16.0,
            runSpacing: 12.0,
            children: [
              PrimaryButton(
                label: 'Get in Touch',
                icon: Icons.mail_outline_rounded,
                onPressed: _launchEmail,
              ),
              PrimaryButton(
                label: 'Contact Details',
                isSecondary: true,
                onPressed: () => context.go('/contact'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
