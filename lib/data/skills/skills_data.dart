import '../../models/skill_category.dart';

/// Source of truth for skills data categorized cleanly into primary product design and supporting capabilities.
class SkillsData {
  SkillsData._();

  static const List<SkillCategory> categories = [
    // PRIMARY PRODUCT DESIGN CAPABILITIES (4)
    SkillCategory(
      id: 'ui-ux-product-design',
      title: 'UI/UX & Product Design',
      subtitle: 'Core Specialization',
      isPrimary: true,
      skills: [
        'Interface Design',
        'Responsive Product Design',
        'Enterprise Product Interfaces',
        'Customer-Facing Experiences',
        'Information Hierarchy',
        'Interaction Design',
        'Mobile & Web Interfaces',
      ],
    ),
    SkillCategory(
      id: 'ux-process',
      title: 'UX Process & Strategy',
      subtitle: 'Discovery & Architecture',
      isPrimary: true,
      skills: [
        'Understanding User Needs',
        'Problem Framing',
        'User Research',
        'Information Architecture',
        'User Flows',
        'Interaction Thinking',
        'Usability Considerations',
      ],
    ),
    SkillCategory(
      id: 'design-systems',
      title: 'Design Systems & Handoff',
      subtitle: 'Scalable Component Architecture',
      isPrimary: true,
      skills: [
        'Reusable UI Patterns',
        'Consistency & Alignment',
        'Design Systems',
        'Component Thinking',
        'Figma-Based Design',
        'Developer Collaboration',
        'Design Handoff',
      ],
    ),
    SkillCategory(
      id: 'design-tools',
      title: 'Design Tools',
      subtitle: 'Industry Standard Tooling',
      isPrimary: true,
      skills: [
        'Figma',
        'FigJam',
        'Photopea',
        'Canva',
      ],
    ),

    // SUPPORTING CAPABILITIES (4)
    SkillCategory(
      id: 'frontend-prototyping',
      title: 'Frontend & Prototyping',
      subtitle: 'Supporting Capability',
      isPrimary: false,
      skills: [
        'Flutter',
        'Interactive Prototyping',
        'HTML & CSS',
        'Git & GitHub',
        'Design-to-Code Alignment',
      ],
    ),
    SkillCategory(
      id: 'ai-modern-dev',
      title: 'AI & Modern Dev Workflows',
      subtitle: 'Supporting Capability',
      isPrimary: false,
      skills: [
        'AI-Assisted Workflows',
        'Rapid Exploration',
        'Prototyping Acceleration',
        'Design-to-Development Collaboration',
        'Modern Product Workflows',
      ],
    ),
    SkillCategory(
      id: 'graphic-design-branding',
      title: 'Graphic Design & Branding',
      subtitle: 'Supporting Creative Discipline',
      isPrimary: false,
      skills: [
        'Visual Communication',
        'Brand Identity',
        'Marketing Design',
        'Presentations & Collateral',
        'Campaign & Landing Design',
      ],
    ),
    SkillCategory(
      id: 'video-editing',
      title: 'Video Editing',
      subtitle: 'Supporting Creative Discipline',
      isPrimary: false,
      skills: [
        'Promotional Video Editing',
        'Digital Platform Content',
        'Visual Pacing & Narrative',
        'Motion Graphic Accents',
      ],
    ),
  ];

  static List<SkillCategory> get primaryCategories =>
      categories.where((c) => c.isPrimary).toList();

  static List<SkillCategory> get supportingCategories =>
      categories.where((c) => !c.isPrimary).toList();
}
