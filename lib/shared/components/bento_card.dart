import 'package:flutter/material.dart';
import '../../core/theme/app_theme.dart';
import 'custom_cursor_overlay.dart';

/// Reusable Bento Card matching the rounded, elevated, soft-bordered
/// card aesthetic of mchiu.co.uk.
class BentoCard extends StatefulWidget {
  final Widget child;
  final Color? backgroundColor;
  final double borderRadius;
  final EdgeInsetsGeometry? padding;
  final VoidCallback? onTap;
  final bool isInteractive;
  final BoxBorder? border;
  final double? width;
  final double? height;
  final Clip clipBehavior;

  const BentoCard({
    super.key,
    required this.child,
    this.backgroundColor,
    this.borderRadius = AppTheme.bentoRadius,
    this.padding = const EdgeInsets.all(28.0),
    this.onTap,
    this.isInteractive = true,
    this.border,
    this.width,
    this.height,
    this.clipBehavior = Clip.antiAlias,
  });

  @override
  State<BentoCard> createState() => _BentoCardState();
}

class _BentoCardState extends State<BentoCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    final effectiveBg = widget.backgroundColor ?? AppTheme.surface;
    final isClickable = widget.onTap != null;
    final canLift = widget.isInteractive && _isHovered;

    final effectiveBorder = widget.border ??
        Border.all(
          color: canLift
              ? (isClickable
                  ? AppTheme.primary.withValues(alpha: 0.30)
                  : const Color(0x22000000))
              : AppTheme.border,
          width: 1.0,
        );

    return MouseRegion(
      cursor: isClickable ? SystemMouseCursors.click : MouseCursor.defer,
      onEnter: (_) {
        if (widget.isInteractive) {
          setState(() => _isHovered = true);
          if (isClickable) {
            CursorState.instance.setHovered(true);
          }
        }
      },
      onExit: (_) {
        if (widget.isInteractive) {
          setState(() => _isHovered = false);
          if (isClickable) {
            CursorState.instance.setHovered(false);
          }
        }
      },
      child: GestureDetector(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 240),
          curve: Curves.easeOutCubic,
          width: widget.width,
          height: widget.height,
          transform: Matrix4.translationValues(
            0.0,
            canLift ? (isClickable ? -5.0 : -3.5) : 0.0,
            0.0,
          ),
          padding: widget.padding,
          decoration: BoxDecoration(
            color: effectiveBg,
            borderRadius: BorderRadius.circular(widget.borderRadius),
            border: effectiveBorder,
            boxShadow: canLift
                ? AppTheme.cardHoverShadow
                : AppTheme.cardShadow,
          ),
          clipBehavior: widget.clipBehavior,
          child: widget.child,
        ),
      ),
    );
  }
}
