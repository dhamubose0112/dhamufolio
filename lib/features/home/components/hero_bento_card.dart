import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/components/bento_card.dart';

/// Hero Bento Card mirroring the signature mchiu.co.uk hero card:
/// avatar/portrait on left, friendly editorial greeting, verified role and disciplines.
class HeroBentoCard extends StatelessWidget {
  const HeroBentoCard({super.key});

  @override
  Widget build(BuildContext context) {
    final isNarrow = MediaQuery.of(context).size.width < 768;

    return BentoCard(
      padding: EdgeInsets.zero,
      clipBehavior: Clip.antiAlias,
      child: isNarrow
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 24.0, top: 28.0, right: 24.0),
                  child: _buildTextContent(),
                ),
                const SizedBox(height: 16.0),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: _buildAvatar(isNarrow),
                ),
              ],
            )
          : Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28.0),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: _buildAvatar(isNarrow),
                  ),
                ),
                const SizedBox(width: 24.0),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 32.0, bottom: 32.0, right: 32.0),
                    child: _buildTextContent(),
                  ),
                ),
              ],
            ),
    );
  }

  Widget _buildAvatar(bool isNarrow) {
    return SizedBox(
      width: isNarrow ? 220.0 : 255.0,
      height: isNarrow ? 275.0 : 320.0,
      child: Image.asset(
        'assets/images/dhamu_color_pop.png',
        fit: BoxFit.contain,
        alignment: Alignment.bottomCenter,
        errorBuilder: (context, error, stackTrace) => Container(
          width: 120.0,
          height: 120.0,
          color: const Color(0x144B0082),
          alignment: Alignment.center,
          child: const Text(
            'DB',
            style: TextStyle(
              fontSize: 36.0,
              fontWeight: FontWeight.w700,
              color: AppTheme.primary,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          children: [
            Text(
              'Heyyy',
              style: AppTheme.h2.copyWith(
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(width: 8.0),
            const Text('👋', style: TextStyle(fontSize: 22.0)),
          ],
        ),
        const SizedBox(height: 12.0),
        RichText(
          text: TextSpan(
            style: AppTheme.bodyLarge.copyWith(
              fontSize: 18.0,
              height: 1.5,
              color: AppTheme.foreground,
            ),
            children: [
              const TextSpan(text: "I'm "),
              TextSpan(
                text: 'Dhamu Bose',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppTheme.foreground,
                ),
              ),
              const TextSpan(
                text:
                    ', currently working as a ',
              ),
              TextSpan(
                text: 'Product Designer / UI/UX Designer',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: AppTheme.primary,
                ),
              ),
              const TextSpan(
                text: ' @ Ishtaka Buildmetrix / Sowparnika in Bengaluru.',
              ),
            ],
          ),
        ),
        const SizedBox(height: 18.0),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: const [
            _PillBadge(label: 'Enterprise SaaS & Mobile'),
            _PillBadge(label: 'Design Systems'),
            _PillBadge(label: '2+ Yrs Exp'),
          ],
        ),
      ],
    );
  }
}

class _PillBadge extends StatelessWidget {
  final String label;

  const _PillBadge({required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 6.0),
      decoration: BoxDecoration(
        color: AppTheme.surfaceRaised,
        borderRadius: BorderRadius.circular(100.0),
        border: Border.all(color: AppTheme.border, width: 1.0),
      ),
      child: Text(
        label,
        style: AppTheme.caption.copyWith(
          fontSize: 11.5,
          fontWeight: FontWeight.w600,
          color: AppTheme.foregroundMuted,
        ),
      ),
    );
  }
}
