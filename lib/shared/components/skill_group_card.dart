import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../models/skill_category.dart';
import 'bento_card.dart';

/// Bento card widget to display a structured group of skills.
class SkillGroupCard extends StatelessWidget {
  final SkillCategory category;

  SkillGroupCard({
    super.key,
    SkillCategory? category,
    SkillCategory? skillGroup,
  }) : category = category ?? skillGroup!;

  @override
  Widget build(BuildContext context) {
    return BentoCard(
      backgroundColor: AppTheme.surfaceRaised,
      padding: const EdgeInsets.all(28.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Text(
                  category.title,
                  style: AppTheme.h3.copyWith(
                    fontSize: 16.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              if (!category.isPrimary)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 4.0,
                  ),
                  decoration: BoxDecoration(
                    color: const Color(0xFFF2EFEB),
                    borderRadius: BorderRadius.circular(100.0),
                  ),
                  child: Text(
                    'Supporting',
                    style: AppTheme.caption.copyWith(
                      fontSize: 10.0,
                      fontWeight: FontWeight.w700,
                      letterSpacing: 0.5,
                      color: AppTheme.foregroundMuted,
                    ),
                  ),
                ),
            ],
          ),
          if (category.subtitle != null) ...[
            const SizedBox(height: 6.0),
            Text(
              category.subtitle!,
              style: AppTheme.caption.copyWith(
                color: AppTheme.foregroundMuted,
              ),
            ),
          ],
          const SizedBox(height: 18.0),
          Wrap(
            spacing: 8.0,
            runSpacing: 8.0,
            children: category.skills.map((skill) {
              return Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12.0,
                  vertical: 6.0,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF4F2ED),
                  borderRadius: BorderRadius.circular(100.0),
                  border: Border.all(color: AppTheme.border),
                ),
                child: Text(
                  skill,
                  style: AppTheme.bodySmall.copyWith(
                    color: AppTheme.foreground,
                    fontSize: 12.5,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
