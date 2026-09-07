import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:dhamu_portfolio/app/app.dart';
import 'package:dhamu_portfolio/app/router.dart';

void main() {
  const allRoutes = [
    '/',
    '/work',
    // 9 Professional Projects
    '/work/real-estate-lms',
    '/work/developer-customer-experience-app',
    '/work/real-estate-smart-platform',
    '/work/dubai-real-estate-customer-app',
    '/work/century-commercial-website',
    '/work/century-real-estate-booking-form',
    '/work/mall-foodcourt-survey-nps',
    '/work/real-estate-event-landing-page',
    '/work/habytat-academy-landing-page',
    // 6 Independent & Freelance Projects
    '/work/yellowman',
    '/work/restoo',
    '/work/maradhi',
    '/work/wovzo-ops',
    '/work/namma-pookadai',
    '/work/sri-shirdi-saibaba-website',
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

    // Verify Next Project text exists (Developer Customer Experience App)
    expect(find.text('Developer Customer Experience App'), findsOneWidget);

    // Navigate to next project
    AppRouter.router.go('/work/developer-customer-experience-app');
    await tester.pumpAndSettle();
    expect(find.text('Developer Customer Experience App'), findsAtLeastNWidgets(1));

    // Verify Previous Project text exists (Real Estate LMS)
    expect(find.text('Real Estate LMS'), findsOneWidget);
    // Verify Next Project text exists (Real Estate Smart Platform)
    expect(find.text('Real Estate Smart Platform'), findsOneWidget);
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

    // Last project: Sri Shirdi Saibaba Website -> should have Previous, but NO Next
    AppRouter.router.go('/work/sri-shirdi-saibaba-website');
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

    // 4. Work page previews with real covers and titles
    AppRouter.router.go('/work');
    await tester.pumpAndSettle();
    expect(find.text('Real Estate Smart Platform'), findsAtLeastNWidgets(1));

    // 5. Home page selected work preview
    AppRouter.router.go('/');
    await tester.pumpAndSettle();
    expect(find.text('Real Estate Smart Platform'), findsAtLeastNWidgets(1));
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

  testWidgets('WovZo Ops Case Study Structure & Content Verification', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const DhamuPortfolioApp());
    await tester.pumpAndSettle();

    AppRouter.router.go('/work/wovzo-ops');
    await tester.pumpAndSettle();

    expect(find.text('WovZo Ops — Social Media Automation & CRM Platform'), findsOneWidget);
    expect(find.text('Project Overview & Vision'), findsOneWidget);
    expect(find.text('The Challenge: Fragmented Agency Operations'), findsOneWidget);
    expect(find.text('UX Architecture & Visual Flow Builder'), findsOneWidget);
    expect(find.text('Interface Architecture & Runtime Simulation'), findsOneWidget);
    expect(find.text('Design Impact & Technology Stack'), findsOneWidget);
    expect(find.bySemanticsLabel('WovZo Ops hero visual'), findsOneWidget);
  });

  testWidgets('Namma Pookadai Case Study Structure & Content Verification', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const DhamuPortfolioApp());
    await tester.pumpAndSettle();

    AppRouter.router.go('/work/namma-pookadai');
    await tester.pumpAndSettle();

    expect(find.text('Namma Pookadai — Fresh Flower Boutique Website'), findsOneWidget);
    expect(find.text('Project Overview & Boutique Identity'), findsOneWidget);
    expect(find.text('The Challenge: From Traditional Florist to Digital Boutique'), findsOneWidget);
    expect(find.text('UX Architecture & Multi-Occasion Catalog'), findsOneWidget);
    expect(find.text('Visual Identity & Live Digital Experience'), findsOneWidget);
    expect(find.text('Design Impact & Live Deployment'), findsOneWidget);
    expect(find.bySemanticsLabel('Namma Pookadai hero visual'), findsOneWidget);
  });

  testWidgets('Sri Shirdi Saibaba Temple Case Study Structure & Content Verification', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const DhamuPortfolioApp());
    await tester.pumpAndSettle();

    AppRouter.router.go('/work/sri-shirdi-saibaba-website');
    await tester.pumpAndSettle();

    expect(find.text('Sri Shirdi Saibaba Temple & Management CMS — Palakollu'), findsOneWidget);
    expect(find.text('Project Overview & Dual-Platform Architecture'), findsOneWidget);
    expect(find.text('The Challenge: Preserving Tradition with Modern Operations'), findsOneWidget);
    expect(find.text('Vibe Coding Approach: Dual Experience Design'), findsOneWidget);
    expect(find.text('Visual Architecture & Sanctum Showcase'), findsOneWidget);
    expect(find.text('Vibe Coding Delivery & Operational Impact'), findsOneWidget);
    expect(find.bySemanticsLabel('Sri Shirdi Saibaba Temple hero visual'), findsOneWidget);
  });

  testWidgets('Confidential Professional Projects vs Live Website Projects Verification', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const DhamuPortfolioApp());
    await tester.pumpAndSettle();

    // 1. Confidential Professional Project (real-estate-lms)
    AppRouter.router.go('/work/real-estate-lms');
    await tester.pumpAndSettle();

    expect(find.text('Design Files Confidential (NDA)'), findsOneWidget);
    expect(find.text('Contact Me to View'), findsOneWidget);
    expect(find.text('Contact Me to View Design Files'), findsOneWidget);

    // 2. Live Website Project (century-commercial-website)
    AppRouter.router.go('/work/century-commercial-website');
    await tester.pumpAndSettle();

    expect(find.text('Visit Live Website'), findsOneWidget);
    expect(find.text('Design Files Confidential (NDA)'), findsNothing);
  });

  testWidgets('Mobile Viewport Navigation Menu Icon Right Alignment Verification', (tester) async {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const DhamuPortfolioApp());
    await tester.pumpAndSettle();

    // Check menu icon exists
    final menuFinder = find.byIcon(Icons.menu_rounded);
    expect(menuFinder, findsOneWidget);

    // Verify it is placed on the far right (x > 300 on a 375-wide screen)
    final menuTopLeft = tester.getTopLeft(menuFinder);
    expect(menuTopLeft.dx, greaterThan(300.0));

    // Verify My Resume button is present and placed to the left of the menu icon
    final resumeFinder = find.text('My Resume');
    expect(resumeFinder, findsOneWidget);
    final resumeTopLeft = tester.getTopLeft(resumeFinder);
    expect(resumeTopLeft.dx, lessThan(menuTopLeft.dx));
  });

  testWidgets('Desktop Viewport My Resume Button and Location Badge Verification', (tester) async {
    tester.view.physicalSize = const Size(1280, 800);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(() => tester.view.resetPhysicalSize());

    await tester.pumpWidget(const DhamuPortfolioApp());
    await tester.pumpAndSettle();

    final resumeFinder = find.text('My Resume');
    final locationFinder = find.text('Bengaluru, IN');
    expect(resumeFinder, findsOneWidget);
    expect(locationFinder, findsOneWidget);

    final resumeTopLeft = tester.getTopLeft(resumeFinder);
    final locationTopLeft = tester.getTopLeft(locationFinder);
    expect(resumeTopLeft.dx, lessThan(locationTopLeft.dx));
  });
}
