/// Contact information model.
class ContactInfo {
  final String name;
  final String title;
  final String email;
  final String? phone;
  final String location;
  final String? linkedInUrl;
  final String? gitHubUrl;
  final String? twitterUrl;
  final String? portfolioUrl;
  final String availabilityStatus;

  const ContactInfo({
    required this.name,
    required this.title,
    required this.email,
    this.phone,
    required this.location,
    this.linkedInUrl,
    this.gitHubUrl,
    this.twitterUrl,
    this.portfolioUrl,
    this.availabilityStatus = 'Open for Product Design & UI/UX opportunities',
  });
}
