import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dhamu_portfolio/app/app.dart';
import 'package:dhamu_portfolio/app/router.dart';

void main() {
  const allRoutes = [
    '/',
    '/work',
    // 5 Professional Projects
    '/work/real-estate-lms',
    '/work/sowparnika-cx-app',
    '/work/house-of-habytat',
    '/work/yellowman',
    '/work/restoo',
    // 6 Independent & Freelance Projects
    '/work/maradhi',
    '/work/wovzo-ops',
    '/work/namma-pookadai',
    '/work/sri-shirdi-saibaba-website',
    '/work/real-estate-event-landing-page',
    '/work/habytat-academy-landing-page',
    // Static Pages
    '/about',
    '/experience',
    '/capabilities',
    '/contact',
  ];

  Future<void> testAllRoutesAtViewport(
      WidgetTester tester, Size size, String deviceName) async {
    tester.view.physicalSize = size;
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const DhamuPortfolioApp());
    await tester.pumpAndSettle();

    for (final route in allRoutes) {
      AppRouter.router.go(route);
      await tester.pumpAndSettle();
    }
  }

  testWidgets('Mobile Viewport (375x812) — All 17 Routes & Case Studies', (tester) async {
    await testAllRoutesAtViewport(tester, const Size(375, 812), 'Mobile');
  });

  testWidgets('Tablet Viewport (768x1024) — All 17 Routes & Case Studies', (tester) async {
    await testAllRoutesAtViewport(tester, const Size(768, 1024), 'Tablet');
  });

  testWidgets('Desktop Viewport (1280x800) — All 17 Routes & Case Studies', (tester) async {
    await testAllRoutesAtViewport(tester, const Size(1280, 800), 'Desktop');
  });

  testWidgets('Large Desktop Viewport (1920x1080) — All 17 Routes & Case Studies', (tester) async {
    await testAllRoutesAtViewport(tester, const Size(1920, 1080), 'Large Desktop');
  });

  testWidgets('Case Study Bidirectional Navigation Functionality', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const DhamuPortfolioApp());
    await tester.pumpAndSettle();

    // Start at Real Estate LMS
    AppRouter.router.go('/work/real-estate-lms');
    await tester.pumpAndSettle();
    expect(find.text('Real Estate LMS — Enterprise Product Design'), findsOneWidget);

    // Verify Next Project text exists (Sowparnika CX App)
    expect(find.text('Sowparnika CX App'), findsOneWidget);

    // Navigate to next project
    AppRouter.router.go('/work/sowparnika-cx-app');
    await tester.pumpAndSettle();
    expect(find.text('Sowparnika CX App — Customer Experience Product Design'), findsOneWidget);

    // Verify Previous Project text exists (Real Estate LMS)
    expect(find.text('Real Estate LMS'), findsOneWidget);
    // Verify Next Project text exists (House of Habytat)
    expect(find.text('House of Habytat'), findsOneWidget);
  });

  testWidgets('Invalid Case Study Slug Handling', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const DhamuPortfolioApp());
    await tester.pumpAndSettle();

    AppRouter.router.go('/work/unknown-project-slug');
    await tester.pumpAndSettle();

    expect(find.text('Project Not Found'), findsOneWidget);
  });

  testWidgets('Bounded Case Study Navigation (No loop on first and last projects)', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const DhamuPortfolioApp());
    await tester.pumpAndSettle();

    // First project: Real Estate LMS -> should have Next (Sowparnika CX App), but NO Previous
    AppRouter.router.go('/work/real-estate-lms');
    await tester.pumpAndSettle();
    expect(find.text('Next'), findsOneWidget);
    expect(find.text('Previous'), findsNothing);

    // Last project: Habytat Academy Landing Page -> should have Previous, but NO Next
    AppRouter.router.go('/work/habytat-academy-landing-page');
    await tester.pumpAndSettle();
    expect(find.text('Previous'), findsOneWidget);
    expect(find.text('Next'), findsNothing);
  });

  testWidgets('Phase 04 Completed Pages Structure & Content Verification', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const DhamuPortfolioApp());
    await tester.pumpAndSettle();

    // 1. About Page
    AppRouter.router.go('/about');
    await tester.pumpAndSettle();
    expect(find.text('Designing products that make complex workflows easier to understand and use.'), findsOneWidget);
    expect(find.text('How I Think About Design'), findsOneWidget);
    expect(find.text('Creative Disciplines'), findsOneWidget);
    expect(find.text('Tools & Working Areas'), findsOneWidget);

    // 2. Experience Page
    AppRouter.router.go('/experience');
    await tester.pumpAndSettle();
    expect(find.text('Current Experience'), findsOneWidget);
    expect(find.text('Professional Focus'), findsOneWidget);
    expect(find.text('View Selected Work'), findsOneWidget);

    // 3. Capabilities Page
    AppRouter.router.go('/capabilities');
    await tester.pumpAndSettle();
    expect(find.text('Primary Design Specializations'), findsOneWidget);
    expect(find.text('Supporting Disciplines & Dev Workflows'), findsOneWidget);
    expect(find.text('Explore Work'), findsOneWidget);

    // 4. Contact Page
    AppRouter.router.go('/contact');
    await tester.pumpAndSettle();
    expect(find.text('Let\'s talk about a product, problem, or opportunity.'), findsOneWidget);
    expect(find.text('Email Dhamu'), findsOneWidget);
    expect(find.text('LinkedIn'), findsAtLeastNWidgets(1));
  });

  testWidgets('Phase 05 Visual Asset Integration Verification', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const DhamuPortfolioApp());
    await tester.pumpAndSettle();

    // 1. About page profile portrait
    AppRouter.router.go('/about');
    await tester.pumpAndSettle();
    expect(find.bySemanticsLabel('Dhamu Bose portrait photograph'), findsOneWidget);

    // 2. Maradhi mobile grid case study
    AppRouter.router.go('/work/maradhi');
    await tester.pumpAndSettle();
    expect(find.text('Mobile Interface Showcase'), findsOneWidget);
    expect(find.bySemanticsLabel('Maradhi screen showcase'), findsNWidgets(4));

    // 3. Real Estate Event landing page case study
    AppRouter.router.go('/work/real-estate-event-landing-page');
    await tester.pumpAndSettle();
    expect(find.text('Visual Architecture & Property Showcase'), findsOneWidget);
    expect(find.bySemanticsLabel('Real Estate Event Landing Page primary showcase'), findsOneWidget);

    // 4. Work page previews with real covers and logos
    AppRouter.router.go('/work');
    await tester.pumpAndSettle();
    expect(find.text('House of Habytat • Project Identity'), findsOneWidget);
    expect(find.text('Sowparnika CX App • Project Identity'), findsOneWidget);

    // 5. Home page selected work preview
    AppRouter.router.go('/');
    await tester.pumpAndSettle();
    expect(find.text('House of Habytat • Project Identity'), findsOneWidget);
    expect(find.text('Sowparnika CX App • Project Identity'), findsOneWidget);
  });

  testWidgets('Global 404 Route Handling', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const DhamuPortfolioApp());
    await tester.pumpAndSettle();

    AppRouter.router.go('/completely-invalid-url');
    await tester.pumpAndSettle();

    expect(find.text('Page Not Found'), findsOneWidget);
  });
}
