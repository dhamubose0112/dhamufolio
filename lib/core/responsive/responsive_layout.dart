import 'package:flutter/material.dart';
import '../constants/app_constants.dart';

/// Screen device categories based on standard viewport widths.
enum DeviceScreenType {
  mobile,
  tablet,
  desktop,
  largeDesktop,
}

/// Helper utilities for device breakpoint checks and adaptive sizing.
class ResponsiveLayout {
  ResponsiveLayout._();

  static DeviceScreenType getDeviceType(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    if (width < AppConstants.mobileBreakpoint) {
      return DeviceScreenType.mobile;
    } else if (width < AppConstants.tabletBreakpoint) {
      return DeviceScreenType.tablet;
    } else if (width < AppConstants.desktopBreakpoint) {
      return DeviceScreenType.desktop;
    } else {
      return DeviceScreenType.largeDesktop;
    }
  }

  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < AppConstants.mobileBreakpoint;

  static bool isTablet(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return width >= AppConstants.mobileBreakpoint &&
        width < AppConstants.tabletBreakpoint;
  }

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= AppConstants.tabletBreakpoint;

  /// Returns adaptive horizontal padding based on screen width.
  static double horizontalPadding(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    if (width < AppConstants.mobileBreakpoint) {
      return 20.0;
    } else if (width < AppConstants.tabletBreakpoint) {
      return 32.0;
    } else {
      return 48.0;
    }
  }

  /// Value selector helper based on current screen size.
  static T value<T>({
    required BuildContext context,
    required T mobile,
    T? tablet,
    T? desktop,
    T? largeDesktop,
  }) {
    final type = getDeviceType(context);
    switch (type) {
      case DeviceScreenType.mobile:
        return mobile;
      case DeviceScreenType.tablet:
        return tablet ?? mobile;
      case DeviceScreenType.desktop:
        return desktop ?? tablet ?? mobile;
      case DeviceScreenType.largeDesktop:
        return largeDesktop ?? desktop ?? tablet ?? mobile;
    }
  }
}

/// Responsive builder widget to render different layouts depending on device size.
class ResponsiveBuilder extends StatelessWidget {
  final Widget Function(BuildContext context) mobile;
  final Widget Function(BuildContext context)? tablet;
  final Widget Function(BuildContext context)? desktop;

  const ResponsiveBuilder({
    super.key,
    required this.mobile,
    this.tablet,
    this.desktop,
  });

  @override
  Widget build(BuildContext context) {
    final type = ResponsiveLayout.getDeviceType(context);
    if (type == DeviceScreenType.desktop ||
        type == DeviceScreenType.largeDesktop) {
      if (desktop != null) return desktop!(context);
    }
    if (type == DeviceScreenType.tablet) {
      if (tablet != null) return tablet!(context);
      if (desktop != null) return desktop!(context);
    }
    return mobile(context);
  }
}

/// A centered layout container with max-width and adaptive padding.
class ResponsiveContainer extends StatelessWidget {
  final Widget child;
  final double maxWidth;
  final EdgeInsetsGeometry? padding;

  const ResponsiveContainer({
    super.key,
    required this.child,
    this.maxWidth = AppConstants.maxContentWidth,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    final horizontalPad = ResponsiveLayout.horizontalPadding(context);

    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: maxWidth),
        child: Padding(
          padding: padding ?? EdgeInsets.symmetric(horizontal: horizontalPad),
          child: child,
        ),
      ),
    );
  }
}
