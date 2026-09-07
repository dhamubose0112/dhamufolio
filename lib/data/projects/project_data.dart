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
      thumbnail: 'assets/projects/real_estate_lms/realestate_lms.png',
      heroImage: 'assets/projects/real_estate_lms/realestate_lms.png',
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
          images: [
            'assets/projects/real_estate_lms/realestate_lms.png',
          ],
        ),
      ],
    ),
    Project(
      id: 'p2',
      slug: 'developer-customer-experience-app',
      title: 'Developer Customer Experience App',
      shortTitle: 'Developer Customer Experience App',
      category: ProjectCategory.professional,
      projectType: 'Mobile App / Customer Experience',
      description:
          'Designed a customer-facing real estate app for construction progress tracking, events, project details, bookings, payments and more.',
      role: 'UI/UX Designer',
      company: 'Ishtaka Buildmetrix Private Limited',
      platform: 'iOS & Android Mobile',
      thumbnail: 'assets/projects/developer_cx_app/cxapp.png',
      heroImage: 'assets/projects/developer_cx_app/cxapp.png',
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
          images: [
            'assets/projects/developer_cx_app/cxapp.png',
          ],
        ),
      ],
    ),
    Project(
      id: 'p3',
      slug: 'real-estate-smart-platform',
      title: 'Real Estate Smart Platform',
      shortTitle: 'Real Estate Smart Platform',
      category: ProjectCategory.professional,
      projectType: 'B2B Platform / Partner Portal',
      description:
          'Designed the core B2B platform for channel partners to onboard, submit leads to multiple developers and track commissions.',
      role: 'UI/UX Designer',
      company: 'Ishtaka Buildmetrix Private Limited',
      platform: 'Web & Mobile',
      thumbnail: 'assets/projects/real_estate_smart_platform/realestatesmart.png',
      heroImage: 'assets/projects/real_estate_smart_platform/realestatesmart.png',
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
          images: [
            'assets/projects/real_estate_smart_platform/realestatesmart.png',
          ],
        ),
      ],
    ),
    Project(
      id: 'p_dubai_cx',
      slug: 'dubai-real-estate-customer-app',
      title: 'Dubai Real Estate Customer App',
      shortTitle: 'Dubai Real Estate Customer App',
      category: ProjectCategory.professional,
      projectType: 'Mobile App / Customer Experience',
      description:
          'Designed a premier customer-facing mobile application for luxury property buyers in Dubai to track project handovers, construction milestones, payment schedules, and unit inspections for Dzine Developers.',
      role: 'UI/UX Designer',
      company: 'Dzine Developers',
      platform: 'iOS & Android Mobile',
      thumbnail: 'assets/projects/dubai_real_estate_customer_app/dubai_customer.png',
      heroImage: 'assets/projects/dubai_real_estate_customer_app/dubai_customer.png',
      tags: ['Dubai Real Estate', 'Luxury Property', 'Customer App', 'Payment Plans', 'Mobile App'],
      featured: true,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview',
          description:
              'A dedicated luxury customer portal mobile application tailored for Dubai property buyers and global investors, built for Dzine Developers.',
          content:
              'Dubai real estate investors require real-time visibility into construction milestones, automated payment installment schedules, escrow progress, and streamlined handover inspection appointments.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.problem,
          title: 'Investor Friction',
          description:
              'Overseas buyers frequently faced fragmented updates across email chains, delayed payment confirmations, and cumbersome booking procedures for handover inspections.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.designShowcase,
          title: 'Mobile Customer Experience',
          description:
              'Designed an intuitive, high-end mobile experience featuring construction progress timelines, milestone payment cards, digital document vaults, and snagging inspection booking.',
          showcaseType: ShowcaseSlotType.twoColumn,
          caption: 'Customer journey, construction tracker, and handover booking for iOS & Android',
          images: [
            'assets/projects/dubai_real_estate_customer_app/dubai_customer.png',
          ],
        ),
      ],
    ),
    Project(
      id: 'p_century_commercial',
      slug: 'century-commercial-website',
      title: 'Century Commercial — Enterprise Real Estate Website',
      shortTitle: 'Century Commercial',
      category: ProjectCategory.professional,
      projectType: 'Enterprise Website / Commercial Real Estate',
      description:
          'Designed the official commercial real estate website for Century Real Estate Holdings, showcasing 3,000+ acres of strategic landbanks, marquee business parks, and built-to-suit office developments across Bengaluru.',
      role: 'UI/UX Designer',
      company: 'Century Real Estate Holdings',
      platform: 'Responsive Web (Desktop & Mobile)',
      thumbnail: 'assets/projects/century_commercial_website/commercial_website.png',
      heroImage: 'assets/projects/century_commercial_website/commercial_website.png',
      externalUrl: 'https://commercial.centuryrealestate.in/',
      tags: ['Commercial Real Estate', 'Built-to-Suit', 'Enterprise Web', 'Business Parks', 'Responsive UX', 'Bengaluru'],
      featured: true,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview',
          description:
              'Designing a dedicated institutional web platform to showcase over 50 years of commercial real estate excellence, prime landbanks, and Grade-A business spaces across Bengaluru.',
          content:
              'Century Real Estate Holdings has shaped Bengaluru\'s skyline since 1973 with a 3,000-acre landbank and over 20+ million sq. ft. developed and delivered. With rapid corporate expansion into North and East Bengaluru, Century needed a standalone, modern commercial web presence to present its upcoming business parks, built-to-suit office solutions, and integrated mixed-use hubs to enterprise occupiers, CXOs, and institutional investors.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.problem,
          title: 'The Challenge & Strategic Intent',
          description:
              'Transitioning from traditional developer brochures to a high-converting digital experience that communicates scale, architectural elegance, and sustainability.',
          content:
              'Enterprise leasing decisions require deep trust, technical clarity, and rapid access to property specifications. Previously, prospective corporate tenants and brokers had to rely on static PDFs and manual presentations. The goal was to build an intuitive, interactive platform featuring dynamic project filtering (Ongoing, Upcoming, Completed), location-based highlights (Hebbal, Jakkur, Kundalahalli, Electronic City), and frictionless inquiry mechanisms for custom built-to-suit requirements.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.context,
          title: 'Land. Location. Legacy.',
          description:
              'Positioning Century\'s premier commercial assets: Century Downtown, Century Immencity, Century Silicon City, and Century Nexus.',
          content:
              'The website architecture was designed around Century\'s core value proposition — "Land. Location. Legacy." Visual storytelling incorporates video banners, interactive project carousels, verified developer credentials, and sustainability benchmarks (LEED/IGBC green building standards), catering to modern tech occupiers seeking dynamic workspaces that inspire productivity.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.designShowcase,
          title: 'Interface Architecture & Interactive Portfolio',
          description:
              'Responsive layout system with subtle micro-interactions, category tabs, and streamlined lead capture flows across desktop and mobile.',
          showcaseType: ShowcaseSlotType.fullWidth,
          caption: 'Official Century Commercial production website interface designed for desktop & mobile: commercial.centuryrealestate.in',
          images: [
            'assets/projects/century_commercial_website/commercial_website.png',
          ],
        ),
      ],
    ),
    Project(
      id: 'p_century_booking_form',
      slug: 'century-real-estate-booking-form',
      title: 'Century Real Estate Booking Platform',
      shortTitle: 'Century Booking Platform',
      category: ProjectCategory.professional,
      projectType: 'Enterprise Web App / Customer Onboarding & KYC',
      description:
          'Designed the unified digital booking and multi-applicant onboarding platform for Century Real Estate, streamlining unit allotment, KYC verification, and token payments for homebuyers and NRI investors.',
      role: 'UI/UX Designer',
      company: 'Century Real Estate Holdings',
      platform: 'Web & Tablet Application',
      thumbnail: 'assets/projects/century_booking_form/century_booking_form.png',
      heroImage: 'assets/projects/century_booking_form/century_booking_form.png',
      externalUrl: 'https://www.cms.centuryrealestate.in/#/home',
      tags: ['Real Estate Booking', 'Digital KYC', 'Fintech & Payments', 'Onboarding Flow', 'Design Systems', 'Century'],
      featured: true,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview',
          description:
              'Transforming the legacy paper-intensive apartment booking process into an effortless, multi-step digital onboarding and unit allotment workflow.',
          content:
              'Century Real Estate Holdings required a secure, brand-aligned customer booking platform (CMS) to digitize the property reservation journey for high-value residential and plotted developments. The platform empowers domestic buyers and overseas NRI investors to configure unit selections, complete mandatory Aadhaar/PAN/Passport KYC, provide co-applicant details, and execute instant token advance payments with automated agreement generation.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.problem,
          title: 'The Operational Bottleneck',
          description:
              'Overcoming complex multi-party compliance, fragmented documentation, and prolonged sales closing cycles.',
          content:
              'Historically, booking a luxury home involved 20+ pages of physical paperwork, in-person notarized photocopies, manual data entry by sales consultants, and delayed verification across banking channels. For NRI buyers in Dubai, the US, or Singapore, time zone differences and courier logistics frequently caused booking drop-offs. The goal was to consolidate this entire lifecycle into a unified, transparent wizard that ensures 100% legal compliance while reducing booking completion time from days to under 15 minutes.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.context,
          title: 'Multi-Applicant Architecture & Compliance',
          description:
              'Designing for diverse buyer personas — resident Indians, joint co-owners, corporate entities, and global NRIs.',
          content:
              'The user journey was structured around conditional progressive disclosure. Depending on the selected applicant category (Individual Resident, Joint Owners, OCI/PIO, or Company), the flow dynamically adapts required identity documents (Aadhaar front/back, PAN, Passport, Visa stamps), correspondence addresses, and relationship declarations without overwhelming the user.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.designShowcase,
          title: 'Guided Step-by-Step Experience',
          description:
              'Clean, focused form interfaces with contextual tooltips, instant validation, real-time payment gateway triggers, and downloadable booking confirmations.',
          showcaseType: ShowcaseSlotType.fullWidth,
          caption: 'Century Real Estate digital booking and customer onboarding application: cms.centuryrealestate.in',
          images: [
            'assets/projects/century_booking_form/century_booking_form.png',
          ],
        ),
      ],
    ),
    Project(
      id: 'p_foodcourt_survey',
      slug: 'mall-foodcourt-survey-nps',
      title: 'Mall Foodcourt Customer Survey & NPS Platform',
      shortTitle: 'Foodcourt Survey & NPS',
      category: ProjectCategory.professional,
      projectType: 'Tablet & Kiosk UX / Customer Feedback & Analytics',
      description:
          'Designed an interactive on-premise tablet survey and real-time backend Net Promoter Score (NPS) analytics platform for shopping mall foodcourt diners.',
      role: 'UI/UX Designer',
      company: 'Ishtaka Buildmetrix Private Limited',
      platform: 'Tablet Kiosk & Web Analytics Dashboard',
      thumbnail: 'assets/projects/foodcourt_survey/foodcourt_survey.png',
      heroImage: 'assets/projects/foodcourt_survey/foodcourt_survey.png',
      tags: ['Foodcourt UX', 'Customer Feedback', 'NPS Analytics', 'Tablet Kiosk', 'Real-Time Dashboard', 'Mall Operations'],
      featured: true,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview',
          description:
              'Creating a frictionless 30-second on-premise survey experience paired with an executive Net Promoter Score (NPS) analytics dashboard for mall operators.',
          content:
              'Shopping mall foodcourts serve thousands of visitors daily across dozens of quick-service restaurant (QSR) outlets. Mall facility management and foodcourt management teams needed an engaging, rapid customer satisfaction mechanism to gather immediate diner sentiment on food quality, seating cleanliness, speed of service, and ambiance, automatically aggregating responses into live NPS metrics.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.problem,
          title: 'The Feedback Fatigue Challenge',
          description:
              'Diners on the go ignore long forms. The interface needed to be instantaneous, intuitive, and visually inviting.',
          content:
              'Traditional paper comment cards or SMS survey links generate sub-1% response rates because diners are busy finishing meals or leaving. The challenge was to design a kiosk and QR experience with touch-optimized micro-interactions that complete in under 30 seconds, capturing high-volume authentic sentiment without disrupting the dining experience.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.context,
          title: 'Real-Time Backend NPS Architecture',
          description:
              'Connecting front-of-house diner sentiment with actionable operational alerts for housekeeping, tenant managers, and floor supervisors.',
          content:
              'Beyond customer-facing inputs, the platform includes a powerful backend analytics engine. Feedback is calculated in real-time into promoter, passive, and detractor distributions, triggering instant automated alerts to facility teams when hygiene or food temperature scores dip below benchmark thresholds.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.designShowcase,
          title: 'Kiosk Interface & Analytics Dashboard',
          description:
              'High-contrast touch targets, visual emoji ratings, and modular KPI scorecards engineered for high-traffic public tablet deployment.',
          showcaseType: ShowcaseSlotType.fullWidth,
          caption: 'Foodcourt customer survey kiosk interface and backend NPS sentiment monitoring system',
          images: [
            'assets/projects/foodcourt_survey/foodcourt_survey.png',
          ],
        ),
      ],
    ),
    Project(
      id: 'p8',
      slug: 'real-estate-event-landing-page',
      title: 'Dubai Real Estate Opportunities — Investor Event Landing Page',
      shortTitle: 'Real Estate Event Landing Page',
      category: ProjectCategory.professional,
      projectType: 'Marketing Landing Page / Vibe Coded Web',
      description:
          'High-conversion luxury real estate marketing landing page designed and vibe-coded to present prime Dubai residential and investment opportunities from leading developers (Emaar, Sobha, Damac) to investors in Bengaluru.',
      role: 'Product Designer & Frontend Developer (Vibe Coded)',
      platform: 'Responsive Web / Vercel',
      thumbnail: 'assets/projects/real_estate_event/real_estate_event_hero.png',
      heroImage: 'assets/projects/real_estate_event/real_estate_event_hero.png',
      externalUrl: 'https://dubai-landing-page.vercel.app/',
      verifiedOutcome: 'Live on Vercel • Multi-Developer Luxury Showcase',
      tags: ['Vibe Coded', 'Landing Page', 'Dubai Real Estate', 'Luxury Properties', 'Conversion Design'],
      featured: true,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview & Purpose',
          description:
              'A high-conversion luxury marketing landing page designed and vibe-coded to bridge prospective property buyers and institutional investors from Bengaluru directly to premier Dubai developers including Emaar, Sobha Realty, and Damac. The platform consolidates premium residential listings, off-plan projects, and high-yield investment pathways into an elegant, single-destination discovery experience.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.problem,
          title: 'The Challenge: Fragmented Discovery for Cross-Border Investors',
          description:
              'Evaluating international real estate from India often feels overwhelming because each overseas developer operates separate portals with varying pricing structures, payment plans, and legal terms. Bengaluru investors required a trusted, localized advisory gateway that simplified developer comparisons and offered direct private consultation booking.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.processAndDesignSystem,
          title: 'The Solution: "One Platform. Multiple Developers."',
          description:
              'Engineered a cohesive editorial web experience featuring an immersive dusk skyline hero, developer verification trust badges, property category filters (Luxury Residences, Waterfront Towers, Downtown Penthouses, Family Communities), and a dedicated Investor Event registration module with one-click private consultation booking.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.designShowcase,
          title: 'Visual Architecture & Property Showcase',
          description:
              'Showcasing the cinematic dusk skyline hero section, developer trust badges (Emaar, Sobha, Damac), and architectural property showcase cards.',
          showcaseType: ShowcaseSlotType.editorialSplit,
          caption: 'Luxury property showcases engineered for Dubai real estate investors',
          images: [
            'assets/projects/real_estate_event/dubai_luxury_villa.jpg',
            'assets/projects/real_estate_event/dubai_waterfront_apartment.jpg',
          ],
        ),
        CaseStudySection(
          type: CaseStudySectionType.outcome,
          title: 'Key Capabilities & Live Deployment',
          description:
              'Rapidly vibe-coded and deployed live to Vercel with responsive mobile-first navigation, optimized high-resolution architectural imagery, smooth micro-interactions, and clear conversion pathways for high-net-worth investor inquiries.',
        ),
      ],
    ),
    Project(
      id: 'p9',
      slug: 'habytat-academy-landing-page',
      title: 'Habytat Academy — Career Acceleration Platform Landing Page',
      shortTitle: 'Habytat Academy',
      category: ProjectCategory.professional,
      projectType: 'EdTech Platform Landing Page / Vibe Coded Web',
      description:
          'Industry-driven career acceleration platform landing page designed and vibe-coded to bridge campus education with real-world corporate experience across real estate, proptech, and marketing.',
      role: 'Product Designer & Frontend Developer (Vibe Coded)',
      platform: 'Next.js / Responsive Web / Vercel',
      thumbnail: 'assets/projects/habytat_academy/habytat_academy_hero.png',
      heroImage: 'assets/projects/habytat_academy/habytat_academy_hero.png',
      externalUrl: 'https://habytat-academy.vercel.app/',
      verifiedOutcome: 'Live on Vercel • Modern Dark Glassmorphic UI',
      tags: ['Vibe Coded', 'EdTech', 'Landing Page', 'PropTech Academy', 'Career Acceleration'],
      featured: true,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview: "From Campus To Corporate"',
          description:
              'Habytat Academy was built as an industry-driven career acceleration platform for future real estate, proptech, marketing, and business leaders. Designed and vibe-coded from concept to production, the landing page articulates how immersive learning, hands-on internships, live site visits, and industry mentorship prepare students for fast-paced corporate environments.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.problem,
          title: 'The Challenge: "The Industry is Evolving Faster Than Classrooms"',
          description:
              'Traditional university education predominantly emphasizes academic theory, leaving graduates ill-equipped with the practical tools, domain familiarity, communication confidence, and real-world exposure demanded by the modern property and technology sectors.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.processAndDesignSystem,
          title: 'The Solution: Future-Ready Tracks & Interactive Journey',
          description:
              'Designed a sleek dark-mode glassmorphic visual system with 6 distinct career tracks (Real Estate & Sales, Marketing & Branding, PropTech & CRM, Business Operations, Personal Branding, Industry Projects). Integrated an interactive "Before vs After" transformation comparison, dynamic exposure tickers, 5-stage enrollment roadmap, and frictionless multi-channel application funnels.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.designShowcase,
          title: 'Visual Interface & Program Architecture',
          description:
              'Featuring the hero headline "From Campus To Corporate", program bento cards, floating value propositions, and high-contrast call-to-action triggers.',
          showcaseType: ShowcaseSlotType.fullWidth,
          caption: 'Habytat Academy live landing page hero section showcasing modern typography and dark aesthetic',
          images: [
            'assets/projects/habytat_academy/habytat_academy_hero.png',
          ],
        ),
        CaseStudySection(
          type: CaseStudySectionType.outcome,
          title: 'Implementation & Vibe Coding Outcome',
          description:
              'Developed with modern frontend practices, rich fluid typography, custom glassmorphism effects, and deployed live to Vercel for high-speed engagement and student conversions.',
        ),
      ],
    ),

    // -------------------------------------------------------------
    // INDEPENDENT / FREELANCE PROJECTS
    // -------------------------------------------------------------
    Project(
      id: 'i_yellowman',
      slug: 'yellowman',
      title: 'YellowMan — Technician Service Platform',
      shortTitle: 'YellowMan',
      category: ProjectCategory.independent,
      projectType: 'Mobile App / Service Marketplace',
      description:
          'Designed a mobile platform that simplifies technician discovery, job management, and everyday service requests.',
      role: 'UI/UX Designer',
      platform: 'Mobile App (iOS & Android)',
      thumbnail: 'assets/projects/yellowman/yellowman.png',
      heroImage: 'assets/projects/yellowman/yellowman.png',
      verifiedOutcome: 'Freelance UX Redesign • Mobile Service Platform',
      tags: ['Mobile App', 'Service Marketplace', 'Field Services', 'Job Cards', 'Technician UX'],
      featured: true,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview & Service Model',
          description:
              'YellowMan is an on-demand mobile service marketplace designed to connect customers with skilled local technicians for everyday service, maintenance, and repair needs. The app enables users to discover nearby technicians, post detailed service requirements, manage digital job cards, and track service progress through a seamless, trustworthy mobile experience.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.problem,
          title: 'The Challenge: Fragmented & Uncertain Field Services',
          description:
              'Finding dependable local technicians for urgent home repairs typically involves endless phone calls, uncertain pricing, lack of verified credentials, and no visibility into job progress. Both customers and technicians suffered from miscommunicated requirements, missed appointments, and payment disputes.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.processAndDesignSystem,
          title: 'UX Architecture: Streamlined Discovery & Job Cards',
          description:
              'Architected a transparent, step-by-step mobile journey encompassing instant service category shortcuts (AC Service, Electrical, Plumbing, CCTV), a frictionless "Post Your Job" bidding module, verified technician profile listings with live availability indicators and ratings, and structured digital job cards that track work from diagnosis to completion.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.designShowcase,
          title: 'Mobile Interface & Service Marketplace Showcase',
          description:
              'Showcasing YellowMan\'s vibrant branding, clean home dashboard, nearby technician discovery flow, and structured digital job cards.',
          showcaseType: ShowcaseSlotType.fullWidth,
          caption: 'YellowMan mobile app interface — connecting customers with skilled local technicians through intuitive job cards and real-time availability',
          images: [
            'assets/projects/yellowman/yellowman.png',
          ],
        ),
        CaseStudySection(
          type: CaseStudySectionType.outcome,
          title: 'Design Impact & Value Delivered',
          description:
              'Delivered a cohesive, user-friendly mobile experience that eliminates service discovery ambiguity, empowers local skilled tradespeople with steady job leads, and provides homeowners with peace of mind through reliable, tracked services.',
        ),
      ],
    ),
    Project(
      id: 'i_restoo',
      slug: 'restoo',
      title: 'QR-Based Restaurant Ordering — Product Design',
      shortTitle: 'Dhamu Foods',
      category: ProjectCategory.independent,
      projectType: 'FoodTech / QR Ordering',
      description:
          'Designed a seamless QR-based dining experience that lets customers browse menus, place orders and complete payments directly from their table.',
      role: 'UI/UX Designer',
      platform: 'Mobile Web / Customer Experience',
      thumbnail: 'assets/projects/restoo/restoo.png',
      heroImage: 'assets/projects/restoo/restoo.png',
      verifiedOutcome: 'Product Design Concept • In-Restaurant QR Ordering',
      tags: ['FoodTech', 'QR Ordering', 'Mobile Web', 'Tabletop UX', 'Digital Dining'],
      featured: true,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview & Dining Experience',
          description:
              'Dhamu Foods is a modern QR-based digital dining platform engineered to streamline the in-restaurant dining experience. By scanning a table QR code stand, diners can instantly access the live interactive menu, customize dietary preferences (Veg / Non-veg), review item totals, apply coupons, and complete orders directly from their mobile browser without waiting for waitstaff.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.problem,
          title: 'The Challenge: Peak-Hour Restaurant Bottlenecks',
          description:
              'Traditional dine-in ordering frequently suffers from prolonged wait times during rush hours. Waiters get overwhelmed managing table orders, customer modifications are prone to human errors, and billing delays cause table turnover inefficiencies and customer dissatisfaction.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.processAndDesignSystem,
          title: 'UX Architecture: 4-Step Tabletop Dining Journey',
          description:
              'Designed an intuitive 4-stage customer flow: 1) Scan QR & Start — seamless table detection without app installation; 2) Explore Menu — organized categories (Specials, Combos, Best Savers) with item descriptions, prep time, and calories; 3) Place Your Order — granular cart reviews and instant add-ons; 4) Secure Payment & Order Tracking — transparent bill breakdown with service taxes and digital checkout.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.designShowcase,
          title: 'Mobile Interface & Tabletop Showcase',
          description:
              'Showcasing the dark ambient visual theme, table QR code stand presentation, category navigation, and streamlined order review screens.',
          showcaseType: ShowcaseSlotType.fullWidth,
          caption: 'Dhamu Foods mobile ordering interface — tabletop QR scan to instant order placement and checkout',
          images: [
            'assets/projects/restoo/restoo.png',
          ],
        ),
        CaseStudySection(
          type: CaseStudySectionType.outcome,
          title: 'Design Impact & Operational Efficiency',
          description:
              'Accelerated table turnover rates, minimized ordering friction, eliminated order entry mistakes, and elevated customer dining satisfaction with a sleek, self-serve mobile interface.',
        ),
      ],
    ),
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
      title: 'WovZo Ops — Social Media Automation & CRM Platform',
      shortTitle: 'WovZo Ops',
      category: ProjectCategory.independent,
      projectType: 'Social Media Automation SaaS',
      description:
          'A ManyChat-inspired automation platform designed for agencies to manage client workspaces, Instagram and WhatsApp automations, contacts, live conversations, broadcasts, and analytics from one unified dashboard.',
      role: 'UI/UX Designer & Flutter Developer',
      company: 'Wovzo',
      platform: 'Web & Desktop SaaS',
      thumbnail: 'assets/projects/wovzo_ops/wovzo_ops.png',
      heroImage: 'assets/projects/wovzo_ops/wovzo_ops.png',
      verifiedOutcome: 'Multi-Workspace Automation SaaS • Visual Flow Builder & CRM',
      tags: [
        'ManyChat-inspired',
        'Automation SaaS',
        'Visual Flow Builder',
        'Flutter Web',
        'Audience CRM',
        'Live Inbox',
        'Instagram & WhatsApp',
      ],
      featured: true,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview & Vision',
          description:
              'WovZo Ops is an in-house social media automation platform designed for Wovzo and its agency clients. Inspired by interaction patterns of tools like ManyChat, the system is architected around a multi-workspace agency model to manage Instagram and WhatsApp conversations, campaigns, contacts, and automated workflows from a single operational dashboard.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.problem,
          title: 'The Challenge: Fragmented Agency Operations',
          description:
              'Managing multiple client social accounts across fragmented tools creates friction and communication delays for agency teams. The goal was to build a centralized system where operators can switch client workspaces, construct reusable automation flows, manage customer audience segments, schedule broadcast campaigns, and resolve escalated conversations through a unified inbox.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.processAndDesignSystem,
          title: 'UX Architecture & Visual Flow Builder',
          description:
              'Architected a workspace-first navigation hierarchy with an intuitive 4-pane visual builder: Node Library on the left, Infinite Canvas for drag-and-drop connections, Contextual Inspector for node parameters, and a bottom Status Bar for validation and autosave. This structure makes complex logic—triggers, conditions, actions, and delays—approachable without code.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.designShowcase,
          title: 'Interface Architecture & Runtime Simulation',
          description:
              'Showcasing the multi-workspace dashboard and simulated runtime engine. Built an independent mock execution runtime supporting sequential steps, branching logic, variable resolution, and loop protection to validate flow behavior prior to live Meta API connectivity.',
          showcaseType: ShowcaseSlotType.fullWidth,
          caption: 'WovZo Ops — ManyChat-inspired multi-workspace social media automation platform and visual flow builder',
          images: [
            'assets/projects/wovzo_ops/wovzo_ops.png',
          ],
        ),
        CaseStudySection(
          type: CaseStudySectionType.outcome,
          title: 'Design Impact & Technology Stack',
          description:
              'Delivered a comprehensive prototype validating the operational journey across Workspace CRM, Live Inbox, Campaign Broadcasts, and Channel Health. Engineered with Flutter, Riverpod, and Clean Architecture to test end-to-end UX before production Meta API and webhook rollout.',
        ),
      ],
    ),
    Project(
      id: 'i3',
      slug: 'namma-pookadai',
      title: 'Namma Pookadai — Fresh Flower Boutique Website',
      shortTitle: 'Namma Pookadai',
      category: ProjectCategory.independent,
      projectType: 'Freelance Website / E-Commerce',
      description:
          'Responsive e-commerce boutique website designed and developed for Namma Pookadai, a bespoke floral studio in Saravanampatti, Coimbatore, showcasing fresh handcrafted bouquets, occasion collections, and custom orders.',
      role: 'Web Designer & Developer',
      company: 'Namma Pookadai',
      platform: 'Responsive Web / Vercel',
      thumbnail: 'assets/projects/namma_pookadai/namma_pookadai_hero.png',
      heroImage: 'assets/projects/namma_pookadai/namma_pookadai_hero.png',
      brandLogo: 'assets/projects/namma_pookadai/namma_pookadai_logo.png',
      isLogoOnly: false,
      externalUrl: 'https://namma-pookadai.vercel.app/',
      verifiedOutcome: 'Live on Vercel • Fresh Flower Boutique & Custom Gifting',
      tags: [
        'Freelance Web',
        'Flower Boutique',
        'E-Commerce',
        'Custom Orders',
        'Coimbatore',
        'Responsive Design',
      ],
      featured: true,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview & Boutique Identity',
          description:
              'Namma Pookadai is a modern floral boutique and gifting studio based in Saravanampatti, Coimbatore. Designed and developed from concept to live deployment, the website establishes a vibrant digital storefront for customers to discover fresh daily blooms, explore curated arrangements by occasion, configure personalized custom gift boxes, and place direct delivery orders.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.problem,
          title: 'The Challenge: From Traditional Florist to Digital Boutique',
          description:
              'Local floral studios frequently rely on foot traffic and unstructured WhatsApp inquiries, leading to miscommunicated customization requests, delayed pricing responses, and missed orders during peak occasions. The objective was to create a warm, delightful web experience that streamlines product exploration, showcases artisanal craftsmanship, and automates custom arrangement inquiries.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.processAndDesignSystem,
          title: 'UX Architecture & Multi-Occasion Catalog',
          description:
              'Architected an intuitive browsing flow featuring multi-tier discovery: Shop by Occasion (Birthdays, Weddings, Anniversaries, Valentine’s), Shop by Flower Type (Roses, Tulips, Sunflowers, Orchids), and Shop by Style (Minimal, Premium, Romantic). Implemented a dedicated Custom Order module allowing customers to combine flowers with chocolates, personal written notes, and bespoke delivery preferences.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.designShowcase,
          title: 'Visual Identity & Live Digital Experience',
          description:
              'Featuring a soft floral aesthetic with ambient pastel gradients, subtle floating petal micro-interactions, responsive product grids, and a frictionless slide-over shopping cart.',
          showcaseType: ShowcaseSlotType.fullWidth,
          caption: 'Namma Pookadai live production website hero and catalog experience: namma-pookadai.vercel.app',
          images: [
            'assets/projects/namma_pookadai/namma_pookadai_hero.png',
          ],
        ),
        CaseStudySection(
          type: CaseStudySectionType.outcome,
          title: 'Design Impact & Live Deployment',
          description:
              'Successfully designed, coded, and deployed live to Vercel with mobile-first responsiveness, integrated Google Maps store locator for the Saravanampatti studio, customer review social proof, and direct local delivery call-to-actions.',
        ),
      ],
    ),
    Project(
      id: 'i4',
      slug: 'sri-shirdi-saibaba-website',
      title: 'Sri Shirdi Saibaba Temple & Management CMS — Palakollu',
      shortTitle: 'Sri Shirdi Saibaba Temple',
      category: ProjectCategory.independent,
      projectType: 'Temple Portal & Custom CMS / Vibe Coded Web',
      description:
          'Official spiritual community portal and custom administrative CMS designed and vibe-coded for Sri Shirdi Sai Baba Temple in Palakollu, enabling devotees to explore temple history, festivals, and donations alongside a dedicated back-office management system.',
      role: 'Product Designer & Developer (Vibe Coded)',
      company: 'Sri Shirdi Sai Baba Temple Trust',
      platform: 'Production Web & Admin CMS',
      thumbnail: 'assets/projects/saibaba_temple/saibaba_temple_hero.png',
      heroImage: 'assets/projects/saibaba_temple/saibaba_temple_hero.png',
      externalUrl: 'https://www.srishirdisaibabatemplepalakollu.org/',
      verifiedOutcome: 'Live Web & CMS • Community Portal & Devotee Donation Engine',
      tags: [
        'Vibe Coded',
        'Freelance Web',
        'Temple CMS',
        'Community Portal',
        'Donation System',
        'Palakollu',
      ],
      featured: true,
      caseStudyAvailable: true,
      sections: [
        CaseStudySection(
          type: CaseStudySectionType.overview,
          title: 'Project Overview & Dual-Platform Architecture',
          description:
              'Designed and vibe-coded a full-lifecycle digital presence for Sri Shirdi Sai Baba Temple in Palakollu, Andhra Pradesh. The solution encompasses a public devotee portal (srishirdisaibabatemplepalakollu.org) presenting temple history, daily pooja schedules, festival calendars, and online donation channels, paired with a custom administrative back-office system (sai-temple-cms.vercel.app/admin) for temple administrators to manage events, content, and devotee records.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.problem,
          title: 'The Challenge: Preserving Tradition with Modern Operations',
          description:
              'Historically, communication regarding temple timings, festival celebrations, and donor contributions relied on physical notice boards, local flyers, and manual cash receipts. Overseas and regional devotees lacked a trustworthy, real-time channel to stay connected with temple events or contribute to sacred causes. Additionally, trust administrators required a dedicated digital interface to update announcements and track donations without technical overhead.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.processAndDesignSystem,
          title: 'Vibe Coding Approach: Dual Experience Design',
          description:
              'Architected two complementary systems: 1) A reverent, culturally resonant public portal with warm saffron accents, sacred serif typography, photo galleries of the Palakollu sanctum, bilingual Telugu/English support, and streamlined donation pathways. 2) A secured, lightweight administrative CMS enabling non-technical trust members to publish festival updates, manage event schedules, update photo galleries, and track donor inquiries.',
        ),
        CaseStudySection(
          type: CaseStudySectionType.designShowcase,
          title: 'Visual Architecture & Sanctum Showcase',
          description:
              'Featuring the majestic sanctum sanctorum hero banner, clean navigational layout with Telugu localization, responsive mobile-friendly layouts, and seamless donation call-to-actions.',
          showcaseType: ShowcaseSlotType.fullWidth,
          caption: 'Official Sri Shirdi Sai Baba Temple Palakollu live web experience: srishirdisaibabatemplepalakollu.org',
          images: [
            'assets/projects/saibaba_temple/saibaba_temple_hero.png',
          ],
        ),
        CaseStudySection(
          type: CaseStudySectionType.outcome,
          title: 'Vibe Coding Delivery & Operational Impact',
          description:
              'Vibe-coded from concept to production and deployed live on custom domain infrastructure alongside a secured Vercel-hosted management dashboard. Empowers the Palakollu temple committee with autonomous digital stewardship while connecting thousands of devotees across the globe.',
        ),
      ],
    ),
  ];
}
