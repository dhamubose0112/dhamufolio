import 'package:flutter/material.dart';

/// Bento Grid and Warm Editorial Design System for Dhamu Bose portfolio,
/// matching the exact theme, layout, skeleton, and color of mchiu.co.uk.
class AppTheme {
  AppTheme._();

  // Exact mchiu.co.uk Color Palette
  static const Color background = Color(0xFFEAE8E3);    // Warm stone cream
  static const Color surface = Color(0xFFF5F3EE);       // Warm ivory card
  static const Color surfaceRaised = Color(0xFFFFFFFF); // Pure white card
  static const Color surfaceSubtle = Color(0xFFE2DFD8);
  static const Color surfaceNav = Color(0xE6F5F3EE);     // 90% opacity for blur pill
  
  // Borders & Accents
  static const Color border = Color(0x0E000000);       // Subtle 5% black card border
  static const Color borderSubtle = Color(0x08000000); // 3% black
  static const Color borderStrong = Color(0x18000000); // 9% black
  static const Color primary = Color(0xFF4B0082);      // Signature Indigo #4B0082
  static const Color purple = Color(0xFF4B0082);       // Unified Accent Indigo #4B0082
  static const Color accent = Color(0xFF4B0082);       // Unified Accent Indigo #4B0082
  static const Color orange = Color(0xFF4B0082);
  static const Color tagBackground = Color(0xFFE5E2DA);
  
  // Text Colors
  static const Color foreground = Color(0xFF191919);       // Deep graphite charcoal
  static const Color foregroundMuted = Color(0xFF75736E);  // Secondary muted text
  static const Color foregroundSubtle = Color(0xFF9C9A94); // Muted captions & index

  // Gradients
  static const LinearGradient brandGradient = LinearGradient(
    colors: [Color(0xFF4B0082), Color(0xFF6B21A8)], // Indigo brand gradient
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient warmSunGradient = LinearGradient(
    colors: [Color(0xFFFFE877), Color(0xFFF5A623)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Bento Card Radii (exact mchiu.co.uk 32px geometry)
  static const double bentoRadius = 32.0;
  static const double bentoRadiusSmall = 20.0;
  static const double bentoRadiusPill = 100.0;

  // Soft Ambient Bento Shadows
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color(0x06000000),
      blurRadius: 20.0,
      offset: Offset(0, 4),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x03000000),
      blurRadius: 6.0,
      offset: Offset(0, 1),
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> cardHoverShadow = [
    BoxShadow(
      color: Color(0x14000000),
      blurRadius: 28.0,
      offset: Offset(0, 10),
      spreadRadius: 0,
    ),
    BoxShadow(
      color: Color(0x08000000),
      blurRadius: 10.0,
      offset: Offset(0, 3),
      spreadRadius: 0,
    ),
  ];

  static const List<BoxShadow> navPillShadow = [
    BoxShadow(
      color: Color(0x0C000000),
      blurRadius: 24.0,
      offset: Offset(0, 6),
      spreadRadius: 0,
    ),
  ];

  // Primary Typography Family
  static const String fontFamily = 'Syne';

  // Bento Typography
  static TextStyle heroIdentityStyle(double viewportWidth) {
    final size = ((viewportWidth / 1440.0) * 100.0).clamp(64.0, 108.0);
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: FontWeight.w700,
      height: 0.96,
      letterSpacing: -size * 0.03,
      color: foreground,
    );
  }

  static TextStyle mobileHeroIdentityStyle(double viewportWidth) {
    final size = ((viewportWidth / 390.0) * 52.0).clamp(42.0, 56.0);
    return TextStyle(
      fontFamily: fontFamily,
      fontSize: size,
      fontWeight: FontWeight.w700,
      height: 0.98,
      letterSpacing: -size * 0.025,
      color: foreground,
    );
  }

  // Level 1: Major Page Titles (Desktop & Mobile)
  static const TextStyle chapterHeader = TextStyle(
    fontFamily: fontFamily,
    fontSize: 40.0,
    fontWeight: FontWeight.w700,
    height: 1.15,
    letterSpacing: -0.9,
    color: foreground,
  );

  static const TextStyle chapterHeaderMobile = TextStyle(
    fontFamily: fontFamily,
    fontSize: 28.0,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.5,
    color: foreground,
  );

  static const TextStyle editorialHero = TextStyle(
    fontFamily: fontFamily,
    fontSize: 42.0,
    fontWeight: FontWeight.w700,
    height: 1.14,
    letterSpacing: -0.9,
    color: foreground,
  );

  static const TextStyle display = TextStyle(
    fontFamily: fontFamily,
    fontSize: 30.0,
    fontWeight: FontWeight.w700,
    height: 1.2,
    letterSpacing: -0.6,
    color: foreground,
  );

  // Level 2: Section Headers & Major Categories
  static const TextStyle h1 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 26.0,
    fontWeight: FontWeight.w700,
    height: 1.24,
    letterSpacing: -0.5,
    color: foreground,
  );

  static const TextStyle h2 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 22.0,
    fontWeight: FontWeight.w700,
    height: 1.28,
    letterSpacing: -0.35,
    color: foreground,
  );

  // Level 3: Card Titles & Component Headers
  static const TextStyle h3 = TextStyle(
    fontFamily: fontFamily,
    fontSize: 18.0,
    fontWeight: FontWeight.w700,
    height: 1.35,
    letterSpacing: -0.25,
    color: foreground,
  );

  static const TextStyle projectTitleFeatured = TextStyle(
    fontFamily: fontFamily,
    fontSize: 32.0,
    fontWeight: FontWeight.w700,
    height: 1.18,
    letterSpacing: -0.8,
    color: foreground,
  );

  static const TextStyle projectTitle = TextStyle(
    fontFamily: fontFamily,
    fontSize: 24.0,
    fontWeight: FontWeight.w700,
    height: 1.22,
    letterSpacing: -0.5,
    color: foreground,
  );

  // Body & Paragraph Typography
  static const TextStyle bodyLarge = TextStyle(
    fontFamily: fontFamily,
    fontSize: 16.5,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: -0.1,
    color: foreground,
  );

  static const TextStyle body = TextStyle(
    fontFamily: fontFamily,
    fontSize: 14.5,
    fontWeight: FontWeight.w400,
    height: 1.6,
    letterSpacing: -0.05,
    color: Color(0xFF55524E),
  );

  static const TextStyle bodySmall = TextStyle(
    fontFamily: fontFamily,
    fontSize: 13.0,
    fontWeight: FontWeight.w400,
    height: 1.55,
    color: Color(0xFF6E6B66),
  );

  // Meta, Captions & Badges
  static const TextStyle caption = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11.5,
    fontWeight: FontWeight.w500,
    height: 1.4,
    letterSpacing: 0.2,
    color: foregroundSubtle,
  );

  static const TextStyle label = TextStyle(
    fontFamily: fontFamily,
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    letterSpacing: 0.5,
    color: foreground,
  );

  static const TextStyle sectionIndex = TextStyle(
    fontFamily: fontFamily,
    fontSize: 11.0,
    fontWeight: FontWeight.w700,
    letterSpacing: 1.2,
    color: foregroundSubtle,
  );

  static ThemeData get themeData {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      brightness: Brightness.light,
      scaffoldBackgroundColor: background,
      colorScheme: const ColorScheme.light(
        surface: surface,
        primary: primary,
        outline: border,
      ),
      dividerColor: border,
      dividerTheme: const DividerThemeData(
        color: border,
        thickness: 1.0,
        space: 1.0,
      ),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.iOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.linux: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.macOS: FadeUpwardsPageTransitionsBuilder(),
          TargetPlatform.windows: FadeUpwardsPageTransitionsBuilder(),
        },
      ),
      textTheme: const TextTheme(
        displayLarge: editorialHero,
        displayMedium: display,
        headlineMedium: h1,
        headlineSmall: h2,
        titleLarge: h3,
        bodyLarge: bodyLarge,
        bodyMedium: body,
        bodySmall: bodySmall,
        labelLarge: label,
      ).apply(fontFamily: fontFamily),
    );
  }
}
