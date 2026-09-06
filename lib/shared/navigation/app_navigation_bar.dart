import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/constants/app_constants.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_theme.dart';
import '../components/custom_cursor_overlay.dart';

class NavItem {
  final String label;
  final String path;

  const NavItem({required this.label, required this.path});
}

const List<NavItem> navigationItems = [
  NavItem(label: 'All', path: '/'),
  NavItem(label: 'Work', path: '/work'),
  NavItem(label: 'About', path: '/about'),
  NavItem(label: 'Experience', path: '/experience'),
  NavItem(label: 'Capabilities', path: '/capabilities'),
  NavItem(label: 'Contact', path: '/contact'),
];

/// Floating glassmorphism pill navigation inspired by mchiu.co.uk.
class AppNavigationBar extends StatelessWidget {
  final String currentPath;

  const AppNavigationBar({
    super.key,
    required this.currentPath,
  });

  @override
  Widget build(BuildContext context) {
    final isCompact =
        MediaQuery.of(context).size.width < AppConstants.tabletBreakpoint;
    final horizontalPad = ResponsiveLayout.horizontalPadding(context);

    return Container(
      width: double.infinity,
      color: Colors.transparent,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPad,
        vertical: 20.0,
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppConstants.maxContentWidth),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // 1. Left: Brand Logo ("designer dhamu")
              MouseRegion(
                cursor: SystemMouseCursors.click,
                onEnter: (_) => CursorState.instance.setHovered(true),
                onExit: (_) => CursorState.instance.setHovered(false),
                child: GestureDetector(
                  onTap: () => context.go('/'),
                  child: Image.asset(
                    'assets/logo/dhamu_logo.png',
                    height: isCompact ? 30.0 : 36.0,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              // 2. Center: Floating Pill Menu (Desktop) or Hamburger (Mobile)
              if (isCompact)
                Container(
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceRaised,
                    shape: BoxShape.circle,
                    border: Border.all(color: AppTheme.border, width: 1.0),
                    boxShadow: AppTheme.cardShadow,
                  ),
                  child: IconButton(
                    icon: const Icon(Icons.menu_rounded, color: AppTheme.foreground, size: 20.0),
                    onPressed: () => _openEditorialMobileMenu(context),
                    tooltip: 'Open navigation menu',
                  ),
                )
              else
                ClipRRect(
                  borderRadius: BorderRadius.circular(100.0),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 12.0, sigmaY: 12.0),
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: AppTheme.surfaceNav,
                        borderRadius: BorderRadius.circular(100.0),
                        border: Border.all(color: AppTheme.border, width: 1.0),
                        boxShadow: AppTheme.navPillShadow,
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: navigationItems.map((item) {
                          final bool isActive = item.path == '/'
                              ? currentPath == '/'
                              : currentPath.startsWith(item.path);

                          return _PillNavItem(
                            label: item.label,
                            path: item.path,
                            isActive: isActive,
                          );
                        }).toList(),
                      ),
                    ),
                  ),
                ),

              // 3. Right: Subtle Location / Availability Badge
              if (!isCompact)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0, vertical: 7.0),
                  decoration: BoxDecoration(
                    color: AppTheme.surfaceRaised,
                    borderRadius: BorderRadius.circular(100.0),
                    border: Border.all(color: AppTheme.border, width: 1.0),
                    boxShadow: AppTheme.cardShadow,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 7.0,
                        height: 7.0,
                        decoration: const BoxDecoration(
                          color: AppTheme.primary,
                          shape: BoxShape.circle,
                        ),
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        'Bengaluru, IN',
                        style: AppTheme.caption.copyWith(
                          fontSize: 11.5,
                          fontWeight: FontWeight.w600,
                          color: AppTheme.foregroundMuted,
                        ),
                      ),
                    ],
                  ),
                )
              else
                const SizedBox.shrink(),
            ],
          ),
        ),
      ),
    );
  }

  void _openEditorialMobileMenu(BuildContext context) {
    showGeneralDialog(
      context: context,
      barrierDismissible: true,
      barrierLabel: 'Navigation Menu',
      barrierColor: Colors.black.withValues(alpha: 0.4),
      transitionDuration: const Duration(milliseconds: 200),
      pageBuilder: (dialogContext, animation, secondaryAnimation) {
        return Scaffold(
          backgroundColor: AppTheme.background,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/logo/dhamu_logo.png',
                        height: 28.0,
                        fit: BoxFit.contain,
                      ),
                      Container(
                        decoration: BoxDecoration(
                          color: AppTheme.surfaceRaised,
                          shape: BoxShape.circle,
                          border: Border.all(color: AppTheme.border),
                        ),
                        child: IconButton(
                          icon: const Icon(Icons.close_rounded, size: 20.0, color: AppTheme.foreground),
                          onPressed: () => Navigator.of(dialogContext).pop(),
                          tooltip: 'Close navigation menu',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  const Divider(),
                  const SizedBox(height: 28.0),

                  Expanded(
                    child: ListView(
                      physics: const BouncingScrollPhysics(),
                      children: navigationItems.asMap().entries.map((entry) {
                        final idx = '0${entry.key}';
                        final item = entry.value;
                        final isActive = item.path == '/'
                            ? currentPath == '/'
                            : currentPath.startsWith(item.path);

                        return _buildMobileMenuItem(
                          context: dialogContext,
                          index: idx,
                          label: item.label,
                          path: item.path,
                          isActive: isActive,
                        );
                      }).toList(),
                    ),
                  ),

                  const Divider(),
                  const SizedBox(height: 20.0),
                  Text(
                    'Dhamu Bose — Product Designer / UI/UX Designer',
                    style: AppTheme.sectionIndex.copyWith(fontSize: 10.5, letterSpacing: 0.5),
                  ),
                  const SizedBox(height: 6.0),
                  Text(
                    'Bengaluru, India • bosedhamu@gmail.com',
                    style: AppTheme.caption.copyWith(color: AppTheme.foregroundMuted),
                  ),
                  const SizedBox(height: 12.0),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildMobileMenuItem({
    required BuildContext context,
    required String index,
    required String label,
    required String path,
    required bool isActive,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? AppTheme.surfaceRaised : Colors.transparent,
          borderRadius: BorderRadius.circular(16.0),
          border: isActive ? Border.all(color: AppTheme.border) : null,
          boxShadow: isActive ? AppTheme.cardShadow : null,
        ),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
          leading: Text(
            index,
            style: AppTheme.sectionIndex.copyWith(
              color: isActive ? AppTheme.primary : AppTheme.foregroundSubtle,
            ),
          ),
          title: Text(
            label,
            style: AppTheme.h3.copyWith(
              fontWeight: isActive ? FontWeight.w700 : FontWeight.w500,
              color: isActive ? AppTheme.foreground : AppTheme.foregroundMuted,
            ),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 14.0,
            color: isActive ? AppTheme.foreground : AppTheme.foregroundSubtle,
          ),
          onTap: () {
            Navigator.of(context).pop();
            context.go(path);
          },
        ),
      ),
    );
  }
}

class _PillNavItem extends StatefulWidget {
  final String label;
  final String path;
  final bool isActive;

  const _PillNavItem({
    required this.label,
    required this.path,
    required this.isActive,
  });

  @override
  State<_PillNavItem> createState() => _PillNavItemState();
}

class _PillNavItemState extends State<_PillNavItem> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) {
        setState(() => _isHovered = true);
        CursorState.instance.setHovered(true);
      },
      onExit: (_) {
        setState(() => _isHovered = false);
        CursorState.instance.setHovered(false);
      },
      child: GestureDetector(
        onTap: () => context.go(widget.path),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          decoration: BoxDecoration(
            color: widget.isActive
                ? AppTheme.surfaceRaised
                : (_isHovered ? Colors.black.withValues(alpha: 0.04) : Colors.transparent),
            borderRadius: BorderRadius.circular(100.0),
            boxShadow: widget.isActive ? AppTheme.cardShadow : null,
          ),
          child: Text(
            widget.label,
            style: AppTheme.label.copyWith(
              fontSize: 13.0,
              fontWeight: widget.isActive ? FontWeight.w700 : FontWeight.w500,
              color: widget.isActive
                  ? AppTheme.foreground
                  : (_isHovered ? AppTheme.foreground : AppTheme.foregroundMuted),
            ),
          ),
        ),
      ),
    );
  }
}
