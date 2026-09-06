import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// Global controller to inform the custom cursor when an element is hovered.
class CursorState extends ChangeNotifier {
  static final CursorState instance = CursorState._();
  CursorState._();

  bool _isHovered = false;
  bool get isHovered => _isHovered;

  void setHovered(bool hovered) {
    if (_isHovered != hovered) {
      _isHovered = hovered;
      notifyListeners();
    }
  }
}

/// Custom animated cursor overlay providing a precision dot and smooth follower
/// ring matching the signature desktop interaction of mchiu.co.uk.
class CustomCursorOverlay extends StatefulWidget {
  final Widget child;

  const CustomCursorOverlay({super.key, required this.child});

  @override
  State<CustomCursorOverlay> createState() => _CustomCursorOverlayState();
}

class _CustomCursorOverlayState extends State<CustomCursorOverlay>
    with SingleTickerProviderStateMixin {
  Offset _pointerPos = const Offset(-100, -100);
  Offset _ringPos = const Offset(-100, -100);
  bool _isVisible = false;
  bool _isPointerDown = false;

  late final AnimationController _animController;

  @override
  void initState() {
    super.initState();
    _animController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 16),
    )..addListener(_tick);

    if (kIsWeb) {
      _animController.repeat();
    }
  }

  void _tick() {
    if (!_isVisible) return;
    // Smooth trailing lerp for outer ring
    final dx = _ringPos.dx + (_pointerPos.dx - _ringPos.dx) * 0.22;
    final dy = _ringPos.dy + (_pointerPos.dy - _ringPos.dy) * 0.22;
    if ((dx - _ringPos.dx).abs() > 0.05 || (dy - _ringPos.dy).abs() > 0.05) {
      setState(() {
        _ringPos = Offset(dx, dy);
      });
    }
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Only show custom cursor on web desktop platforms
    if (!kIsWeb) {
      return widget.child;
    }

    return MouseRegion(
      cursor: SystemMouseCursors.none,
      onHover: (event) {
        setState(() {
          _pointerPos = event.position;
          if (!_isVisible) {
            _ringPos = event.position;
            _isVisible = true;
          }
        });
      },
      onExit: (_) {
        setState(() {
          _isVisible = false;
        });
      },
      child: Listener(
        onPointerDown: (_) => setState(() => _isPointerDown = true),
        onPointerUp: (_) => setState(() => _isPointerDown = false),
        child: Stack(
          children: [
            widget.child,
            if (_isVisible)
              AnimatedBuilder(
                animation: CursorState.instance,
                builder: (context, _) {
                  final isHovered = CursorState.instance.isHovered;
                  final ringSize = isHovered ? 48.0 : (_isPointerDown ? 24.0 : 34.0);
                  final dotSize = _isPointerDown ? 4.0 : 6.0;

                  return IgnorePointer(
                    child: Stack(
                      children: [
                        // Trailing Follower Ring
                        Positioned(
                          left: _ringPos.dx - ringSize / 2,
                          top: _ringPos.dy - ringSize / 2,
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 180),
                            curve: Curves.easeOutCubic,
                            width: ringSize,
                            height: ringSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: isHovered
                                  ? const Color(0x18000000)
                                  : const Color(0x0A000000),
                              border: Border.all(
                                color: isHovered
                                    ? const Color(0x40000000)
                                    : const Color(0x28000000),
                                width: 1.2,
                              ),
                            ),
                          ),
                        ),
                        // Precise Cursor Dot
                        Positioned(
                          left: _pointerPos.dx - dotSize / 2,
                          top: _pointerPos.dy - dotSize / 2,
                          child: Container(
                            width: dotSize,
                            height: dotSize,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(0xFF191919),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
          ],
        ),
      ),
    );
  }
}
