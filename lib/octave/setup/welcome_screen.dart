import 'package:flutter/material.dart';

import '../../l10n/app_localizations.dart';
import '../../services/storage_service.dart';
import '../theme/octave_theme.dart';

/// First screen, before signing in: the logo, one sentence, one button.
/// The personal setup comes after sign-in ([SetupFlow]).
class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key, required this.onFinished});

  final VoidCallback onFinished;

  Future<void> _start() async {
    await StorageService().setOnboardingCompleted(true);
    onFinished();
  }

  @override
  Widget build(BuildContext context) {
    final colors = context.octave;
    final l10n = AppLocalizations.of(context)!;
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: colors.background,
      body: SafeArea(
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 480),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Spacer(flex: 3),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(26),
                      child: Image.asset(
                        'assets/logobig.png',
                        width: 112,
                        height: 112,
                      ),
                    ),
                  ),
                  const SizedBox(height: 28),
                  Text(
                    'Octave',
                    textAlign: TextAlign.center,
                    style: textTheme.displayLarge?.copyWith(fontSize: 40),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    l10n.welcomeTagline,
                    textAlign: TextAlign.center,
                    style: textTheme.bodyLarge?.copyWith(
                      color: colors.text2,
                      fontSize: 18,
                    ),
                  ),
                  const Spacer(flex: 4),
                  SizedBox(
                    height: 52,
                    child: FilledButton(
                      onPressed: _start,
                      style: FilledButton.styleFrom(
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                      ),
                      child: Text(l10n.welcomeStart),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
