import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/theme/app_theme.dart';
import '../../models/project.dart';

/// Reusable project card displaying metadata, description, tags, and routing action.
class ProjectCard extends StatefulWidget {
  final Project project;
  final bool compact;

  const ProjectCard({
    super.key,
    required this.project,
    this.compact = false,
  });

  @override
  State<ProjectCard> createState() => _ProjectCardState();
}

class _ProjectCardState extends State<ProjectCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final project = widget.project;

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => context.go('/work/${project.slug}'),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOutCubic,
          transform: Matrix4.translationValues(0.0, _isHovered ? -5.0 : 0.0, 0.0),
          decoration: BoxDecoration(
            color: AppTheme.surfaceRaised,
            borderRadius: BorderRadius.circular(AppTheme.bentoRadius),
            border: Border.all(
              color: _isHovered ? AppTheme.primary.withValues(alpha: 0.35) : AppTheme.border,
              width: 1.0,
            ),
            boxShadow: _isHovered ? AppTheme.cardHoverShadow : AppTheme.cardShadow,
          ),
          padding: EdgeInsets.all(widget.compact ? 20.0 : 28.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Type and Category Badge
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Text(
                          project.projectType.isNotEmpty
                              ? project.projectType[0].toUpperCase() + project.projectType.substring(1).toLowerCase()
                              : '',
                          style: AppTheme.caption.copyWith(
                            letterSpacing: 0.3,
                            fontWeight: FontWeight.w600,
                            color: AppTheme.foregroundMuted,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (project.company != null)
                        Text(
                          project.company!,
                          style: AppTheme.caption,
                        ),
                    ],
                  ),
                  const SizedBox(height: 12.0),

                  // Title
                  Text(
                    project.title,
                    style: AppTheme.h3.copyWith(
                      fontSize: widget.compact ? 18.0 : 22.0,
                      color: _isHovered ? AppTheme.primary : AppTheme.foreground,
                    ),
                  ),
                  const SizedBox(height: 12.0),

                  // Description
                  Text(
                    project.description,
                    style: AppTheme.body,
                  ),
                  const SizedBox(height: 16.0),

                  // Tags
                  Wrap(
                    spacing: 8.0,
                    runSpacing: 8.0,
                    children: project.tags.map((tag) {
                      return Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 4.0,
                        ),
                        decoration: BoxDecoration(
                          color: AppTheme.tagBackground,
                          borderRadius: BorderRadius.circular(4.0),
                          border: Border.all(color: AppTheme.border),
                        ),
                        child: Text(
                          tag,
                          style: AppTheme.caption.copyWith(
                            color: AppTheme.foregroundMuted,
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),

              const SizedBox(height: 24.0),

              // Action Link
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Role: ${project.role}',
                    style: AppTheme.caption,
                  ),
                  Row(
                    children: [
                      Text(
                        project.caseStudyAvailable
                            ? 'View Case Study'
                            : 'View Project Overview',
                        style: AppTheme.label.copyWith(
                          color: _isHovered ? Colors.white : AppTheme.foregroundMuted,
                        ),
                      ),
                      const SizedBox(width: 6.0),
                      Icon(
                        Icons.arrow_forward_rounded,
                        size: 14.0,
                        color: _isHovered ? Colors.white : AppTheme.foregroundMuted,
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
