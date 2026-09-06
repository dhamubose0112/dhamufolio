import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../features/about/about_page.dart';
import '../features/capabilities/capabilities_page.dart';
import '../features/case_study/case_study_page.dart';
import '../features/contact/contact_page.dart';
import '../features/experience/experience_page.dart';
import '../features/home/home_page.dart';
import '../features/not_found/not_found_page.dart';
import '../features/work/work_page.dart';

/// Helper to build silky smooth fade transitions between pages, completely
/// eliminating jarring horizontal right-to-left slide animations.
Page<dynamic> _buildFadePage({
  required Widget child,
  required GoRouterState state,
}) {
  return CustomTransitionPage<void>(
    key: state.pageKey,
    child: child,
    transitionDuration: const Duration(milliseconds: 160),
    reverseTransitionDuration: const Duration(milliseconds: 160),
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurvedAnimation(
          parent: animation,
          curve: Curves.easeOutCubic,
        ),
        child: child,
      );
    },
  );
}

/// Central application router using GoRouter for clean web URLs and deep linking.
class AppRouter {
  AppRouter._();

  static final GoRouter router = GoRouter(
    initialLocation: '/',
    errorPageBuilder: (context, state) => _buildFadePage(
      child: const NotFoundPage(),
      state: state,
    ),
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        pageBuilder: (context, state) => _buildFadePage(
          child: const HomePage(),
          state: state,
        ),
      ),
      GoRoute(
        path: '/work',
        name: 'work',
        pageBuilder: (context, state) => _buildFadePage(
          child: const WorkPage(),
          state: state,
        ),
        routes: [
          GoRoute(
            path: ':slug',
            name: 'case-study',
            pageBuilder: (context, state) {
              final slug = state.pathParameters['slug'] ?? '';
              return _buildFadePage(
                child: CaseStudyPage(slug: slug),
                state: state,
              );
            },
          ),
        ],
      ),
      GoRoute(
        path: '/about',
        name: 'about',
        pageBuilder: (context, state) => _buildFadePage(
          child: const AboutPage(),
          state: state,
        ),
      ),
      GoRoute(
        path: '/experience',
        name: 'experience',
        pageBuilder: (context, state) => _buildFadePage(
          child: const ExperiencePage(),
          state: state,
        ),
      ),
      GoRoute(
        path: '/capabilities',
        name: 'capabilities',
        pageBuilder: (context, state) => _buildFadePage(
          child: const CapabilitiesPage(),
          state: state,
        ),
      ),
      GoRoute(
        path: '/contact',
        name: 'contact',
        pageBuilder: (context, state) => _buildFadePage(
          child: const ContactPage(),
          state: state,
        ),
      ),
    ],
  );
}
