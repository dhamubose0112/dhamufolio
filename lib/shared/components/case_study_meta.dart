import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import '../../models/project.dart';

/// Reusable verified metadata bar for case studies.
/// Only renders fields that are explicitly populated in the project data model.
class CaseStudyMeta extends StatelessWidget {
  final Project project;

  const CaseStudyMeta({super.key, required this.project});

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[];

    // Role (Always verified in resume)
    items.add(_buildMetaItem('Role', project.role));

    // Organization / Company (Only if verified)
    if (project.company != null && project.company!.trim().isNotEmpty) {
      items.add(_buildMetaItem('Organization', project.company!));
    }

    // Platform (Only if verified)
    if (project.platform != null && project.platform!.trim().isNotEmpty) {
      items.add(_buildMetaItem('Platform', project.platform!));
    }

    // Timeline / Year (Only if verified)
    if (project.year != null && project.year!.trim().isNotEmpty) {
      items.add(_buildMetaItem('Timeline', project.year!));
    }

    if (items.isEmpty) {
      return const SizedBox.shrink();
    }

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      decoration: const BoxDecoration(
        border: Border(
          top: BorderSide(color: AppTheme.border, width: 1.0),
          bottom: BorderSide(color: AppTheme.border, width: 1.0),
        ),
      ),
      child: Wrap(
        spacing: 48.0,
        runSpacing: 16.0,
        children: items,
      ),
    );
  }

  Widget _buildMetaItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label,
          style: AppTheme.sectionIndex.copyWith(
            fontSize: 11.0,
            letterSpacing: 0.5,
          ),
        ),
        const SizedBox(height: 6.0),
        Text(
          value,
          style: AppTheme.label.copyWith(
            fontSize: 13.5,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.1,
          ),
        ),
      ],
    );
  }
}
