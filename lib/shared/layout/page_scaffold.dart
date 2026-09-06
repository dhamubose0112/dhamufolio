import 'package:flutter/material.dart';
import '../../core/constants/app_constants.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_theme.dart';
import '../navigation/app_footer.dart';
import '../navigation/app_navigation_bar.dart';

/// Base layout scaffold providing top navigation, responsive content wrapper, and footer.
class PageScaffold extends StatefulWidget {
  final String currentPath;
  final Widget child;
  final bool showFooter;
  final EdgeInsetsGeometry? contentPadding;

  const PageScaffold({
    super.key,
    required this.currentPath,
    required this.child,
    this.showFooter = true,
    this.contentPadding,
  });

  @override
  State<PageScaffold> createState() => _PageScaffoldState();
}

class _PageScaffoldState extends State<PageScaffold> {
  late final ScrollController _scrollController;
  bool _showScrollTop = false;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_onScroll);
  }

  void _onScroll() {
    final show = _scrollController.hasClients && _scrollController.offset > 400;
    if (show != _showScrollTop) {
      setState(() => _showScrollTop = show);
    }
  }

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeOutCubic,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final horizontalPad = ResponsiveLayout.horizontalPadding(context);
    final isMobile = ResponsiveLayout.isMobile(context);

    return Scaffold(
      backgroundColor: AppTheme.background,
      body: Stack(
        children: [
          Column(
            children: [
              AppNavigationBar(currentPath: widget.currentPath),
              Expanded(
                child: SingleChildScrollView(
                  controller: _scrollController,
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Center(
                        child: ConstrainedBox(
                          constraints: const BoxConstraints(
                            maxWidth: AppConstants.maxContentWidth,
                          ),
                          child: Padding(
                            padding: widget.contentPadding ??
                                EdgeInsets.symmetric(
                                  horizontal: horizontalPad,
                                  vertical: isMobile ? 24.0 : 40.0,
                                ),
                            child: widget.child,
                          ),
                        ),
                      ),
                      if (widget.showFooter) const AppFooter(),
                    ],
                  ),
                ),
              ),
            ],
          ),

          // Floating Scroll-To-Top Button (matching mchiu.co.uk bottom-right circular button)
          if (_showScrollTop)
            Positioned(
              right: 28.0,
              bottom: 28.0,
              child: MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: _scrollToTop,
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 200),
                    width: 44.0,
                    height: 44.0,
                    decoration: BoxDecoration(
                      color: AppTheme.surfaceRaised,
                      shape: BoxShape.circle,
                      border: Border.all(color: AppTheme.border, width: 1.0),
                      boxShadow: AppTheme.cardShadow,
                    ),
                    child: const Icon(
                      Icons.keyboard_arrow_up_rounded,
                      color: AppTheme.foreground,
                      size: 24.0,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
