import 'package:flutter/material.dart';
// IMPORT from your local path:
import 'package:flutter_demo/l10n/app_localizations.dart';

class LocalizationDemo extends StatelessWidget {
  const LocalizationDemo({super.key});

  @override
  Widget build(BuildContext context) {
    // This looks up the correct string based on current locale
    final l10n = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: const Text('Localization Demo')),
      body: Center(
        child: Text(
          l10n.helloWorld, // This will show "Hello world!" or "Хай, өнгөт орчлон"
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}