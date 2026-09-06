import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../models/experience.dart';
import 'bento_card.dart';

/// Renders a single structured experience entry in a uniform square/modular Bento Card.
class ExperienceItemWidget extends StatelessWidget {
  final Experience experience;

  const ExperienceItemWidget({
    super.key,
    required this.experience,
  });

  @override
  Widget build(BuildContext context) {
    return BentoCard(
      padding: const EdgeInsets.all(28.0),
      backgroundColor: AppTheme.surfaceRaised,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Header: Duration Pill & Company
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 8.0,
            runSpacing: 6.0,
            children: [
              if (experience.duration != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE8E4DC),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Text(
                    experience.duration!,
                    style: AppTheme.caption.copyWith(
                      fontWeight: FontWeight.w700,
                      fontSize: 11.0,
                      color: AppTheme.foreground,
                    ),
                  ),
                ),
              if (experience.location != null)
                Text(
                  experience.location!,
                  style: AppTheme.caption.copyWith(
                    color: AppTheme.foregroundSubtle,
                    fontSize: 11.0,
                  ),
                ),
            ],
          ),

          const SizedBox(height: 16.0),

          // Role Title
          Text(
            experience.role,
            style: AppTheme.h3.copyWith(
              fontSize: 20.0,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.3,
            ),
          ),

          if (experience.company != null) ...[
            const SizedBox(height: 4.0),
            Text(
              experience.company!,
              style: AppTheme.bodySmall.copyWith(
                color: AppTheme.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],

          const SizedBox(height: 16.0),
          const Divider(),
          const SizedBox(height: 16.0),

          // Responsibilities List
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: experience.responsibilities.map((resp) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 6.0, right: 10.0),
                      child: Container(
                        width: 5.0,
                        height: 5.0,
                        decoration: const BoxDecoration(
                          color: AppTheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        resp,
                        style: AppTheme.bodySmall.copyWith(
                          color: AppTheme.foregroundMuted,
                          height: 1.5,
                          fontSize: 13.0,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),

          // Focus Areas / Tags
          if (experience.focusAreas.isNotEmpty) ...[
            const SizedBox(height: 14.0),
            Wrap(
              spacing: 6.0,
              runSpacing: 6.0,
              children: experience.focusAreas.map((area) {
                return Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 4.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2EFEB),
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(color: AppTheme.border),
                  ),
                  child: Text(
                    area,
                    style: AppTheme.caption.copyWith(
                      color: AppTheme.foregroundMuted,
                      fontSize: 11.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}

// Alias for convenience
class ExperienceItem extends StatelessWidget {
  final Experience experience;

  const ExperienceItem({super.key, required this.experience});

  @override
  Widget build(BuildContext context) {
    return ExperienceItemWidget(experience: experience);
  }
}
