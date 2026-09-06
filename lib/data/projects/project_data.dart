import '../../models/case_study.dart';
import '../../models/project.dart';

/// Source of truth for portfolio projects based strictly on resume data.
class ProjectData {
  ProjectData._();

  static const List<Project> allProjects = [
    // -------------------------------------------------------------
    // PROFESSIONAL PROJECTS
    // -------------------------------------------------------------
    Project(
      id: 'p1',
      slug: 'real-estate-lms',
      title: 'Real Estate LMS — Enterprise Product Design',
      shortTitle: 'Real Estate LMS',
      category: ProjectCategory.professional,
      projectType: 'Enterprise SaaS / Product Design',
      description:
          'Designed a comprehensive lead management platform for real estate operators to track the entire lead lifecycle, workflows, dashboards and business processes.',
      role: 'UI/UX Designer',
      company: 'Ishtaka Buildmetrix Private Limited',
      platform: 'Web & Tablet',
      tags: ['Enterprise SaaS', 'Lead Lifecycle', 'Dashboards', 'Workflows', 'Design Systems'],
      featured: true,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview',
          description:
              'A comprehensive lead management system (LMS) designed for enterprise real estate developers and operators to track their end-to-end sales pipeline and business operations.',
          content:
              'Real estate operators require real-time visibility into lead progression, team productivity, follow-up cycles, and site visit scheduling. The goal was to consolidate complex multi-stage lead operations into an intuitive dashboard and workflow interface.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.problem,
          title: 'The Challenge',
          description:
              'Sales managers and calling teams struggled to manage thousands of active inquiries across distributed teams without an integrated pipeline view, leading to delayed follow-ups and missed conversion opportunities.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.context,
          title: 'Context & Domain',
          description:
              'Enterprise real estate sales workflows involve high inquiry volumes, multiple agent handoffs, and critical SLA timers. Legacy spreadsheets and fragmented tools caused communication breakdowns and lead leakage.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.designShowcase,
          title: 'Interface & Dashboard Design',
          description:
              'Designed clean, data-dense dashboards, Kanban lead progression boards, and unified interaction logs to provide instant operational clarity for sales agents and executives.',
          showcaseType: ShowcaseSlotType.fullWidth,
          caption: 'Enterprise lead tracking and dashboard architecture for Web & Tablet',
        ),
      ],
    ),
    Project(
      id: 'p2',
      slug: 'sowparnika-cx-app',
      title: 'Sowparnika CX App — Customer Experience Product Design',
      shortTitle: 'Sowparnika CX App',
      category: ProjectCategory.professional,
      projectType: 'Mobile App / Customer Experience',
      description:
          'Designed a customer-facing real estate app for construction progress tracking, events, project details, bookings, payments and more.',
      role: 'UI/UX Designer',
      company: 'Ishtaka Buildmetrix Private Limited',
      platform: 'iOS & Android Mobile',
      brandLogo: 'assets/projects/sowparnika_cx_app/sowparnika_logo.png',
      isLogoOnly: true,
      tags: ['Customer Experience', 'Mobile App', 'Real Estate', 'Progress Tracking', 'Payments'],
      featured: true,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview',
          description:
              'A dedicated customer portal app designed to enhance post-booking engagement for property buyers through transparency, milestone tracking, and self-service management.',
          content:
              'Homebuyers often experience uncertainty after booking an apartment regarding construction milestones, payment schedules, and documentation. The CX app centralizes all project information directly in the homeowner\'s pocket.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.problem,
          title: 'Customer Needs & Friction',
          description:
              'Buyers wanted real-time photo/video updates on building progress, clear payment installment schedules, event notifications, and streamlined support channels without constant manual follow-ups.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.designShowcase,
          title: 'Mobile App Experience',
          description:
              'Created an intuitive mobile-first experience featuring progress visualizers, payment breakdown cards, document repositories, and interactive event updates.',
          showcaseType: ShowcaseSlotType.twoColumn,
          caption: 'Customer journey and post-booking mobile experience for iOS & Android',
        ),
      ],
    ),
    Project(
      id: 'p3',
      slug: 'house-of-habytat',
      title: 'House of Habytat — B2B Product Design',
      shortTitle: 'House of Habytat',
      category: ProjectCategory.professional,
      projectType: 'B2B Platform / Partner Portal',
      description:
          'Designed the core B2B platform for channel partners to onboard, submit leads to multiple developers and track commissions.',
      role: 'UI/UX Designer',
      company: 'Ishtaka Buildmetrix Private Limited',
      platform: 'Web & Mobile',
      brandLogo: 'assets/projects/house_of_habytat/house_of_habytat_logo.png',
      isLogoOnly: true,
      tags: ['B2B Platform', 'Channel Partners', 'Onboarding', 'Commission Tracking', 'SaaS'],
      featured: true,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview',
          description:
              'A centralized B2B ecosystem enabling real estate channel partners to register, access inventory across multiple developers, register buyer leads, and monitor payout statuses.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.context,
          title: 'Industry Problem',
          description:
              'Channel partners frequently deal with opaque lead attribution, delayed commission visibility, and friction when coordinating between different real estate developers.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.designShowcase,
          title: 'Platform Architecture & Handoff',
          description:
              'Established seamless onboarding workflows, multi-developer lead submission forms, and transparent commission ledger dashboards, backed by modular component libraries for developer handoff.',
          showcaseType: ShowcaseSlotType.fullWidth,
          caption: 'B2B partner portal workflows and multi-developer lead ledger',
        ),
      ],
    ),
    Project(
      id: 'p4',
      slug: 'yellowman',
      title: 'Yellowman — Freelance UX Redesign',
      shortTitle: 'Yellowman',
      category: ProjectCategory.professional,
      projectType: 'UX Redesign / Freelance',
      description:
          'Redesigned the user experience for the Yellowman e-commerce store with improved product discovery, cleaner navigation and a simplified checkout flow.',
      role: 'UI/UX Designer',
      platform: 'Responsive Web',
      tags: ['UX Redesign', 'E-Commerce', 'Product Discovery', 'Checkout Flow'],
      featured: false,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview',
          description:
              'An e-commerce redesign focusing on restructuring confusing store navigation, refining catalog readability, and eliminating drop-off points during cart review and checkout.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.problem,
          title: 'Identified UX Friction',
          description:
              'Customers experienced cluttered product listing views, unclear sizing guides, and unexpected steps in the purchase journey that hindered order completions.',
        ),
      ],
    ),
    Project(
      id: 'p5',
      slug: 'restoo',
      title: 'Restoo! — Restaurant Management Product Concept',
      shortTitle: 'Restoo!',
      category: ProjectCategory.professional,
      projectType: 'Product Concept / UX Case Study',
      description:
          'End-to-end product design concept for a restaurant management app covering QR digital menus, live order tracking, kitchen display system (KDS) and instant table checkout.',
      role: 'Product Designer',
      platform: 'Tablet & Mobile',
      tags: ['Product Concept', 'Restaurant Tech', 'Order Flow', 'KDS', 'QR Menu'],
      featured: false,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Concept Overview',
          description:
              'A product exploration addressing restaurant floor bottlenecks through customer self-ordering, synchronized kitchen orders, and automated table billing.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.problem,
          title: 'Operational Inefficiencies',
          description:
              'Peak restaurant hours lead to delayed order taking, order inaccuracies, and customer frustration waiting for bills, placing excessive strain on waitstaff.',
        ),
      ],
    ),

    // -------------------------------------------------------------
    // INDEPENDENT / FREELANCE PROJECTS
    // -------------------------------------------------------------
    Project(
      id: 'i1',
      slug: 'maradhi',
      title: 'Maradhi — Voice-First Communication App',
      shortTitle: 'Maradhi',
      category: ProjectCategory.independent,
      projectType: 'Voice-First App / Independent Project',
      description:
          'Voice-based app for couples with rooms, voice messages, history, favorites, profile and settings.',
      role: 'Product Design & Build',
      platform: 'Mobile (Flutter)',
      thumbnail: 'assets/projects/maradhi/maradhi_cover.png',
      heroImage: 'assets/projects/maradhi/maradhi_cover.png',
      tags: ['Voice-First', 'Couples App', 'Flutter', 'Audio UX', 'Mobile Design'],
      featured: true,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview',
          description:
              'A voice-based application crafted for couples featuring dedicated shared spaces, voice messaging, playback history, favorite moments, and personalized profile settings.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.designShowcase,
          title: 'Mobile Interface Showcase',
          description:
              'Production mobile UI screens designed for intuitive audio messaging, shared memory playback, and intimacy-focused interaction design.',
          showcaseType: ShowcaseSlotType.mobileGrid,
          caption: 'Maradhi production mobile UI: home room, audio player, voice inbox, and memories feed',
          images: [
            'assets/projects/maradhi/maradhi_screen_01.png',
            'assets/projects/maradhi/maradhi_screen_02.png',
            'assets/projects/maradhi/maradhi_screen_03.png',
            'assets/projects/maradhi/maradhi_screen_04.png',
          ],
        ),
      ],
    ),
    Project(
      id: 'i2',
      slug: 'wovzo-ops',
      title: 'Wovzo Ops — Automation SaaS',
      shortTitle: 'Wovzo Ops',
      category: ProjectCategory.independent,
      projectType: 'Automation SaaS Concept / Independent Project',
      description:
          'Automation platform concept for Instagram and WhatsApp workflows with SaaS UI/UX.',
      role: 'Product Design & Build',
      platform: 'Web SaaS',
      tags: ['SaaS UI/UX', 'Workflow Automation', 'WhatsApp API', 'Instagram Workflows'],
      featured: false,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview',
          description:
              'An automation SaaS platform concept designed for managing multi-channel Instagram and WhatsApp customer communication workflows with intuitive SaaS dashboards.',
        ),
      ],
    ),
    Project(
      id: 'i3',
      slug: 'namma-pookadai',
      title: 'Namma Pookadai — Freelance Website',
      shortTitle: 'Namma Pookadai',
      category: ProjectCategory.independent,
      projectType: 'Freelance Website / E-Commerce',
      description:
          'Responsive website for a flower boutique in Coimbatore to promote products and increase sales.',
      role: 'Web Designer & Developer',
      platform: 'Responsive Web',
      brandLogo: 'assets/projects/namma_pookadai/namma_pookadai_logo.png',
      isLogoOnly: true,
      tags: ['Freelance Web', 'Boutique', 'Coimbatore', 'Responsive Design', 'Catalog'],
      featured: false,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview',
          description:
              'A responsive boutique website designed and developed for a Coimbatore flower shop to present seasonal catalogs, highlight bespoke floral arrangements, and drive local customer inquiries.',
        ),
      ],
    ),
    Project(
      id: 'i4',
      slug: 'sri-shirdi-saibaba-website',
      title: 'Sri Shirdi Saibaba Website — Freelance Web Project',
      shortTitle: 'Sri Shirdi Saibaba Website',
      category: ProjectCategory.independent,
      projectType: 'Freelance Web Project',
      description:
          'Temple website designed to promote information and encourage donations.',
      role: 'Web Designer & Developer',
      platform: 'Responsive Web',
      tags: ['Web Design', 'Community Portal', 'Information Architecture', 'Donations'],
      featured: false,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview',
          description:
              'A community web portal created for Sri Shirdi Saibaba Temple, providing organized event schedules, spiritual guidance resources, and straightforward donation channels.',
        ),
      ],
    ),
    Project(
      id: 'i5',
      slug: 'real-estate-event-landing-page',
      title: 'Real Estate Event Landing Page',
      shortTitle: 'Real Estate Event Landing Page',
      category: ProjectCategory.independent,
      projectType: 'Marketing Landing Page / Freelance',
      description:
          'Landing page showcasing Dubai, Europe and Greece properties to Channel Partners.',
      role: 'UI Designer',
      platform: 'Web',
      heroImage: 'assets/projects/real_estate_event/real_estate_event_hero.jpg',
      thumbnail: 'assets/projects/real_estate_event/real_estate_event_hero.jpg',
      tags: ['Landing Page', 'International Real Estate', 'Channel Partners', 'Marketing UI'],
      featured: false,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview',
          description:
              'A high-conversion marketing landing page designed to present prime residential and commercial opportunities across Dubai, Europe, and Greece to prospective channel partners.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.designShowcase,
          title: 'Visual Architecture & Property Showcase',
          description:
              'Showcasing prime international investment properties with luxury visual hierarchy, investor event positioning, and clear registration pathways.',
          showcaseType: ShowcaseSlotType.editorialSplit,
          caption: 'Dubai investor event promotion & luxury real estate showcase assets',
          images: [
            'assets/projects/real_estate_event/real_estate_event_hero.jpg',
            'assets/projects/real_estate_event/dubai_luxury_villa.jpg',
            'assets/projects/real_estate_event/dubai_waterfront_apartment.jpg',
          ],
        ),
      ],
    ),
    Project(
      id: 'i6',
      slug: 'habytat-academy-landing-page',
      title: 'Habytat Academy Landing Page',
      shortTitle: 'Habytat Academy',
      category: ProjectCategory.independent,
      projectType: 'EdTech Landing Page / Freelance',
      description:
          'Landing page for Habytat Real Estate Academy to educate students about real estate.',
      role: 'UI Designer',
      platform: 'Web',
      tags: ['Landing Page', 'EdTech', 'Real Estate Education', 'Conversion Design'],
      featured: false,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview',
          description:
              'An educational landing page structured for Habytat Real Estate Academy to present curriculum modules, mentor credentials, and student registration workflows.',
        ),
      ],
    ),
  ];
}
