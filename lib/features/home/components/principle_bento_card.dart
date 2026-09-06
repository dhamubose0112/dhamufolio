import 'package:flutter/material.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/components/bento_card.dart';

/// Design Principle Bento Card matching the centered quote card on mchiu.co.uk.
class PrincipleBentoCard extends StatelessWidget {
  final String textBefore;
  final String highlightedText;
  final String textAfter;
  final String label;

  const PrincipleBentoCard({
    super.key,
    this.textBefore = 'Design systems improve efficiency and consistency, but ',
    this.highlightedText = 'never at the cost of user experience',
    this.textAfter = '.',
    this.label = 'My Design Principle',
  });

  @override
  Widget build(BuildContext context) {
    return BentoCard(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 28.0),
      backgroundColor: AppTheme.surfaceRaised,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Quote icon glyph
            Container(
              width: 36.0,
              height: 36.0,
              decoration: BoxDecoration(
                color: const Color(0x144B0082),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: const Icon(
                Icons.format_quote_rounded,
                color: AppTheme.primary,
                size: 20.0,
              ),
            ),
            const SizedBox(height: 16.0),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: AppTheme.h2.copyWith(
                  fontSize: 20.0,
                  height: 1.45,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.foreground,
                ),
                children: [
                  TextSpan(text: textBefore),
                  TextSpan(
                    text: highlightedText,
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primary,
                    ),
                  ),
                  TextSpan(text: textAfter),
                ],
              ),
            ),
            const SizedBox(height: 14.0),
            Text(
              label,
              style: AppTheme.sectionIndex.copyWith(
                fontSize: 10.5,
                letterSpacing: 1.6,
                fontWeight: FontWeight.w700,
                color: AppTheme.foregroundSubtle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
