import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';

/// Clean inline or standalone text link with hover cursor.
class TextLink extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool underline;
  final TextStyle? style;
  final IconData? trailingIcon;

  const TextLink({
    super.key,
    required this.text,
    required this.onTap,
    this.underline = false,
    this.style,
    this.trailingIcon,
  });

  @override
  State<TextLink> createState() => _TextLinkState();
}

class _TextLinkState extends State<TextLink> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final baseStyle = widget.style ?? AppTheme.bodySmall;
    final color = _isHovered ? AppTheme.foreground : AppTheme.foregroundMuted;

    Widget content = Text(
      widget.text,
      style: baseStyle.copyWith(
        color: color,
        decoration: widget.underline
            ? TextDecoration.underline
            : TextDecoration.none,
      ),
    );

    if (widget.trailingIcon != null) {
      content = Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Flexible(child: content),
          const SizedBox(width: 5.0),
          AnimatedContainer(
            duration: const Duration(milliseconds: 150),
            transform: Matrix4.translationValues(_isHovered ? 3.0 : 0.0, 0.0, 0.0),
            child: Icon(widget.trailingIcon, size: 14.0, color: color),
          ),
        ],
      );
    }

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: widget.onTap,
        child: content,
      ),
    );
  }
}
