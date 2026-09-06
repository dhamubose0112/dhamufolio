import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

/// Semantic placeholder for project visuals, mockups, or diagrams
/// until real production assets are supplied.
class ImagePlaceholder extends StatelessWidget {
  final String label;
  final double? height;
  final double? width;
  final String? caption;
  final IconData icon;

  const ImagePlaceholder({
    super.key,
    required this.label,
    this.height,
    this.width,
    this.caption,
    this.icon = Icons.photo_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? double.infinity,
      height: height ?? 220.0,
      decoration: BoxDecoration(
        color: AppTheme.surfaceSubtle,
        borderRadius: BorderRadius.circular(8.0),
        border: Border.all(color: AppTheme.border),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Center(
        child: SingleChildScrollView(
          physics: const NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon, size: 28.0, color: AppTheme.foregroundSubtle),
              const SizedBox(height: 8.0),
              Text(
                label,
                textAlign: TextAlign.center,
                style: AppTheme.label.copyWith(color: AppTheme.foregroundMuted),
              ),
              if (caption != null) ...[
                const SizedBox(height: 4.0),
                Text(
                  caption!,
                  textAlign: TextAlign.center,
                  style: AppTheme.caption,
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
