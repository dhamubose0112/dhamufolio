import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/components/bento_card.dart';
import 'social_bento_cards.dart';

/// Stat & Discipline Bento Cards matching the energetic micro-widgets on mchiu.co.uk.
class ExperienceStatsBentoCard extends StatelessWidget {
  const ExperienceStatsBentoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BentoCard(
      padding: const EdgeInsets.all(24.0),
      backgroundColor: AppTheme.surfaceRaised,
      onTap: () => context.go('/experience'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                decoration: BoxDecoration(
                  color: const Color(0x144B0082),
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('⚡', style: TextStyle(fontSize: 12.0)),
                    SizedBox(width: 4.0),
                    Text(
                      'Experience',
                      style: TextStyle(
                        fontSize: 10.5,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 0.5,
                        color: AppTheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const Icon(Icons.north_east_rounded, size: 16.0, color: AppTheme.foregroundSubtle),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            '2+ Years',
            style: AppTheme.h1.copyWith(
              fontSize: 32.0,
              fontWeight: FontWeight.w700,
              letterSpacing: -1.0,
              color: AppTheme.foreground,
            ),
          ),
          const SizedBox(height: 6.0),
          Text(
            'Designing complex SaaS & mobile apps at Ishtaka & Sowparnika.',
            style: AppTheme.caption.copyWith(
              color: AppTheme.foregroundMuted,
              height: 1.4,
            ),
          ),
        ],
      ),
    );
  }
}

class LocationBentoCard extends StatelessWidget {
  const LocationBentoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BentoCard(
      padding: EdgeInsets.zero,
      backgroundColor: AppTheme.surfaceRaised,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        children: [
          // Background animated map gif
          Positioned.fill(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.bentoRadius),
              child: Opacity(
                opacity: 0.35,
                child: appLottie(
                  'assets/gifs/map.json',
                  fit: BoxFit.cover,
                  alignment: Alignment.center,
                ),
              ),
            ),
          ),
          // Subtle scrim overlay
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(AppTheme.bentoRadius),
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    AppTheme.surfaceRaised.withValues(alpha: 0.82),
                    AppTheme.surfaceRaised.withValues(alpha: 0.90),
                  ],
                ),
              ),
            ),
          ),
          // Foreground content
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                      decoration: BoxDecoration(
                        color: const Color(0x144B0082),
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            width: 6.0,
                            height: 6.0,
                            decoration: const BoxDecoration(
                              color: AppTheme.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6.0),
                          const Text(
                            'Available',
                            style: TextStyle(
                              fontSize: 10.5,
                              fontWeight: FontWeight.w700,
                              letterSpacing: 0.5,
                              color: AppTheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.location_on_outlined, size: 16.0, color: AppTheme.foregroundSubtle),
                  ],
                ),
                const SizedBox(height: 16.0),
                Text(
                  'Bengaluru',
                  style: AppTheme.h1.copyWith(
                    fontSize: 28.0,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.8,
                    color: AppTheme.foreground,
                  ),
                ),
                const SizedBox(height: 6.0),
                Text(
                  'Karnataka, India • Open for product design opportunities.',
                  style: AppTheme.caption.copyWith(
                    color: AppTheme.foregroundMuted,
                    height: 1.4,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
