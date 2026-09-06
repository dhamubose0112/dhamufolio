import '../../models/experience.dart';

/// Source of truth for professional and domain experience based strictly on resume data.
class ExperienceData {
  ExperienceData._();

  static const List<Experience> experiences = [
    Experience(
      id: 'exp-ishtaka',
      role: 'UI/UX Designer',
      company: 'Ishtaka Buildmetrix Private Limited',
      location: 'Bengaluru, India',
      duration: 'May 2024 – Present',
      category: ExperienceCategory.productDesign,
      responsibilities: [
        'Designed intuitive and responsive interfaces for real estate SaaS products including CRM, customer apps and partner platforms used by developers and channel partners.',
        'Created user flows, wireframes and high-fidelity prototypes to simplify complex business workflows and improve product usability.',
        'Built and maintained scalable design systems and reusable component libraries across web and mobile platforms.',
        'Collaborated closely with product managers and developers to translate business requirements into effective user experiences and developer-ready handoffs.',
        'Applied prototyping tools and AI-assisted workflows to explore solutions rapidly and validate interactions.',
      ],
      focusAreas: [
        'Real Estate SaaS',
        'CRM & LMS',
        'Customer Portals',
        'Partner Platforms',
        'Design Systems',
        'Product Collaboration',
      ],
    ),
    Experience(
      id: 'exp-graphic-design',
      role: 'Graphic Design & Branding',
      location: 'Supporting Creative Domain',
      category: ExperienceCategory.creativeDomain,
      responsibilities: [
        'Created high-impact social media creatives and marketing materials aligned with brand standards.',
        'Designed promotional banners, pitch presentations, and collateral maintaining strict visual consistency.',
        'Applied structured typography, color palettes, and balanced layouts across diverse marketing touchpoints.',
        'Established cohesive brand language and expressive visual elements.',
      ],
      focusAreas: [
        'Social Media Creatives',
        'Promotional Banners',
        'Presentations',
        'Brand Consistency',
        'Typography & Color',
      ],
    ),
    Experience(
      id: 'exp-video-editing',
      role: 'Video Editing & Motion',
      location: 'Supporting Creative Domain',
      category: ExperienceCategory.creativeDomain,
      responsibilities: [
        'Produced promotional videos and short-form video content tailored for digital platforms.',
        'Crafted narrative storytelling with deliberate pacing, dynamic transitions, and structured audio.',
        'Integrated animated typography, motion graphic accents, and consistent visual styling.',
      ],
      focusAreas: [
        'Promotional Videos',
        'Short-form Content',
        'Motion Typography',
        'Visual Pacing',
      ],
    ),
  ];

  static List<Experience> get productDesignExperiences =>
      experiences.where((e) => e.category == ExperienceCategory.productDesign).toList();

  static List<Experience> get creativeDomainExperiences =>
      experiences.where((e) => e.category == ExperienceCategory.creativeDomain).toList();
}
