import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../core/theme/app_theme.dart';
import '../../../shared/components/bento_card.dart';

Widget appLottie(
  String assetPath, {
  double? width,
  double? height,
  BoxFit? fit,
  Alignment alignment = Alignment.center,
}) {
  final isTest = WidgetsBinding.instance.runtimeType.toString().contains('Test');
  return Lottie.asset(
    assetPath,
    width: width,
    height: height,
    fit: fit,
    alignment: alignment,
    animate: !isTest,
  );
}

/// Signature minimal 1x1 social connect cards with Lottie GIF animations.
/// All GIF icons are calibrated to match the solid visual size of the Twitter GIF.
class EmailBentoCard extends StatelessWidget {
  final String email;

  const EmailBentoCard({
    super.key,
    this.email = 'dhamubose2407@gmail.com',
  });

  @override
  Widget build(BuildContext context) {
    return BentoCard(
      padding: const EdgeInsets.all(24.0),
      backgroundColor: AppTheme.surfaceRaised,
      onTap: () async {
        final uri = Uri.parse('mailto:$email');
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 54.0,
              height: 54.0,
              child: Center(
                child: Transform.scale(
                  scale: 3.2,
                  child: SizedBox(
                    width: 54.0,
                    height: 54.0,
                    child: appLottie(
                      'assets/gifs/gmail.json',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14.0),
            Text(
              'Email Me',
              style: AppTheme.label.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 13.5,
              ),
            ),
            const SizedBox(height: 2.0),
            Text(
              email,
              style: AppTheme.caption.copyWith(
                fontSize: 10.5,
                color: AppTheme.foregroundSubtle,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class LinkedInBentoCard extends StatelessWidget {
  final String url;

  const LinkedInBentoCard({
    super.key,
    this.url = 'https://www.linkedin.com/in/dhamubose/',
  });

  @override
  Widget build(BuildContext context) {
    return BentoCard(
      padding: const EdgeInsets.all(24.0),
      backgroundColor: AppTheme.surfaceRaised,
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 54.0,
              height: 54.0,
              child: Center(
                child: Transform.scale(
                  scale: 1.75,
                  child: SizedBox(
                    width: 54.0,
                    height: 54.0,
                    child: appLottie(
                      'assets/gifs/linkedin.json',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14.0),
            Text(
              'LinkedIn',
              style: AppTheme.label.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 13.5,
              ),
            ),
            const SizedBox(height: 2.0),
            Text(
              '/in/dhamubose',
              style: AppTheme.caption.copyWith(
                fontSize: 10.5,
                color: AppTheme.foregroundSubtle,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class GithubBentoCard extends StatelessWidget {
  final String url;

  const GithubBentoCard({
    super.key,
    this.url = 'https://github.com/dhamubose',
  });

  @override
  Widget build(BuildContext context) {
    return BentoCard(
      padding: const EdgeInsets.all(24.0),
      backgroundColor: AppTheme.surfaceRaised,
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 54.0,
              height: 54.0,
              child: Center(
                child: Transform.scale(
                  scale: 2.15,
                  child: SizedBox(
                    width: 54.0,
                    height: 54.0,
                    child: appLottie(
                      'assets/gifs/github.json',
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 14.0),
            Text(
              'GitHub',
              style: AppTheme.label.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 13.5,
              ),
            ),
            const SizedBox(height: 2.0),
            Text(
              'github.com/dhamubose',
              style: AppTheme.caption.copyWith(
                fontSize: 10.5,
                color: AppTheme.foregroundSubtle,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}

class TwitterBentoCard extends StatelessWidget {
  final String url;

  const TwitterBentoCard({
    super.key,
    this.url = 'https://x.com/dhamubose',
  });

  @override
  Widget build(BuildContext context) {
    return BentoCard(
      padding: const EdgeInsets.all(24.0),
      backgroundColor: AppTheme.surfaceRaised,
      onTap: () async {
        final uri = Uri.parse(url);
        if (await canLaunchUrl(uri)) {
          await launchUrl(uri);
        }
      },
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 54.0,
              height: 54.0,
              child: appLottie(
                'assets/gifs/twitter.json',
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(height: 14.0),
            Text(
              'Twitter / X',
              style: AppTheme.label.copyWith(
                fontWeight: FontWeight.w700,
                fontSize: 13.5,
              ),
            ),
            const SizedBox(height: 2.0),
            Text(
              '@dhamubose',
              style: AppTheme.caption.copyWith(
                fontSize: 10.5,
                color: AppTheme.foregroundSubtle,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
