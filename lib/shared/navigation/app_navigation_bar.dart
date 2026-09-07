import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../core/constants/app_constants.dart';
import '../../core/responsive/responsive_layout.dart';
import '../../core/theme/app_theme.dart';
import '../../data/contact/contact_data.dart';
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

              // 2. Navigation items
              if (isCompact)
                // Right: Row of [My Resume Button, Hamburger Menu Icon] on Mobile/Tablet
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const _ResumeButton(isCompact: true),
                    const SizedBox(width: 10.0),
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
                    ),
                  ],
                )
              else ...[
                // Center: Floating Pill Menu (Desktop)
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

                // Right: Row of [My Resume Button, Subtle Location Badge]
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const _ResumeButton(isCompact: false),
                    const SizedBox(width: 8.0),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 6.0),
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
                            width: 6.0,
                            height: 6.0,
                            decoration: const BoxDecoration(
                              color: AppTheme.primary,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 6.0),
                          Text(
                            'Bengaluru, IN',
                            style: AppTheme.caption.copyWith(
                              fontSize: 11.0,
                              fontWeight: FontWeight.w600,
                              color: AppTheme.foregroundMuted,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
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
                    'Bengaluru, India • dhamu.bose01@gmail.com',
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
          padding: const EdgeInsets.symmetric(horizontal: 11.0, vertical: 6.5),
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
              fontSize: 12.5,
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

/// Pill button for downloading/viewing Dhamu's Resume with download icon.
class _ResumeButton extends StatefulWidget {
  final bool isCompact;

  const _ResumeButton({required this.isCompact});

  @override
  State<_ResumeButton> createState() => _ResumeButtonState();
}

class _ResumeButtonState extends State<_ResumeButton> {
  bool _isHovered = false;

  Future<void> _handleResumeTap() async {
    final resumeUrl = ContactData.info.resumeUrl;
    if (resumeUrl != null && resumeUrl.isNotEmpty) {
      final uri = Uri.parse(resumeUrl);
      if (await canLaunchUrl(uri)) {
        await launchUrl(uri);
        return;
      }
    }

    // Direct email fallback to request the resume if no static URL is configured yet
    final emailUri = Uri.parse(
      'mailto:${ContactData.info.email}?subject=${Uri.encodeComponent('Resume Request — Dhamu Bose')}&body=${Uri.encodeComponent('Hi Dhamu,\n\nI would love to review your latest resume for UI/UX and Product Design opportunities.\n\nBest regards,')}',
    );
    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Contact Dhamu at ${ContactData.info.email} for resume.'),
          backgroundColor: AppTheme.surfaceRaised,
          behavior: SnackBarBehavior.floating,
        ),
      );
    }
  }

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
        onTap: _handleResumeTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 180),
          padding: EdgeInsets.symmetric(
            horizontal: widget.isCompact ? 9.5 : 11.5,
            vertical: widget.isCompact ? 5.5 : 6.0,
          ),
          decoration: BoxDecoration(
            color: _isHovered
                ? AppTheme.primary.withValues(alpha: 0.08)
                : AppTheme.surfaceRaised,
            borderRadius: BorderRadius.circular(100.0),
            border: Border.all(
              color: _isHovered ? AppTheme.primary : AppTheme.border,
              width: 1.0,
            ),
            boxShadow: _isHovered
                ? [
                    BoxShadow(
                      color: AppTheme.primary.withValues(alpha: 0.15),
                      blurRadius: 10.0,
                      offset: const Offset(0, 3),
                    ),
                  ]
                : AppTheme.cardShadow,
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.download_rounded,
                size: widget.isCompact ? 14.0 : 15.0,
                color: _isHovered ? AppTheme.primary : AppTheme.primary,
              ),
              const SizedBox(width: 4.0),
              Text(
                'My Resume',
                style: AppTheme.caption.copyWith(
                  fontSize: widget.isCompact ? 11.0 : 11.5,
                  fontWeight: FontWeight.w600,
                  color: _isHovered ? AppTheme.primary : AppTheme.foreground,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
