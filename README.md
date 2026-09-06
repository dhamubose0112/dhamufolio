# DHAMU BOSE — Portfolio Foundation (Phase 01)

## Project
**DHAMU BOSE Portfolio**

## Technology
- **Framework**: Flutter Web (Dart SDK ^3.11)
- **Routing**: `go_router` (URL path strategy enabled)
- **Target**: Web / Desktop / Tablet / Mobile

## Purpose
Personal UI/UX and Product Design portfolio for **Dhamu Bose**, showcasing 2 years of professional experience across real estate SaaS, customer-facing mobile apps, B2B partner platforms, design systems, and independent vibe-coded builds.

---

## Architecture Overview

```text
lib/
├── main.dart                      # Web entrypoint & path URL strategy
│
├── app/
│   ├── app.dart                   # Root MaterialApp with router & theme
│   ├── app_config.dart            # Identity metadata & global constants
│   └── router.dart                # GoRouter route declarations & 404 handler
│
├── core/
│   ├── constants/                 # Layout and spacing constants
│   ├── responsive/                # Breakpoints & ResponsiveBuilder
│   └── theme/                     # Neutral color tokens & typography foundation
│
├── models/
│   ├── project.dart               # Project data model
│   ├── case_study.dart            # Case study sections model
│   ├── experience.dart            # Work history & responsibilities model
│   ├── skill_category.dart        # Primary & supporting skill categories
│   └── contact.dart               # Contact information model
│
├── data/
│   ├── projects/
│   │   ├── project_data.dart      # Resume-based source of truth for projects
│   │   └── project_repository.dart# Repository query methods
│   ├── experience/
│   │   └── experience_data.dart   # Role & domain experience data
│   ├── skills/
│   │   └── skills_data.dart       # Skills categorized by discipline
│   └── contact/
│       └── contact_data.dart      # Contact configuration
│
├── features/
│   ├── home/                      # Home page (Hero, Selected Work, Previews)
│   ├── work/                      # Work catalog (Professional + Independent)
│   ├── case_study/                # Dynamic case study renderer (/work/:slug)
│   ├── about/                     # Biography, approach, & philosophy
│   ├── experience/                # Full career history & creative domains
│   ├── capabilities/              # Product design competencies & tech tools
│   ├── contact/                   # Contact details & direct mailto link
│   └── not_found/                 # 404 error page
│
└── shared/
    ├── components/                # Buttons, cards, links, placeholders
    ├── layout/                    # PageScaffold wrapper
    └── navigation/                # Responsive navigation bar & footer
```

---

## Getting Started

### 1. Install Dependencies
```bash
flutter pub get
```

### 2. Run Locally (Chrome)
```bash
flutter run -d chrome
```

### 3. Build Web Production Bundle
```bash
flutter build web --release
```
Output will be generated in `build/web/`.
