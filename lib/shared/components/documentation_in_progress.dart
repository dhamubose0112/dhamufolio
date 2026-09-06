import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

/// Reusable component presenting an honest, restrained "Documentation In Progress" state.
class DocumentationInProgress extends StatelessWidget {
  final String projectTitle;

  const DocumentationInProgress({
    super.key,
    required this.projectTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.only(left: 20.0, top: 12.0, bottom: 12.0),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: AppTheme.borderStrong, width: 2.0),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Documentation in Progress',
            style: AppTheme.sectionIndex.copyWith(
              color: AppTheme.foregroundSubtle,
              letterSpacing: 0.5,
            ),
          ),
          const SizedBox(height: 8.0),
          ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 720.0),
            child: Text(
              'Detailed walkthroughs and visual material for "$projectTitle" will be added as design archives are compiled. The overview above represents confirmed project scope and execution.',
              style: AppTheme.body.copyWith(
                color: AppTheme.foregroundMuted,
                fontSize: 14.0,
                height: 1.6,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
