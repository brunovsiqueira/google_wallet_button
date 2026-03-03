import 'package:flutter/material.dart';
import 'package:google_wallet_button/google_wallet_button.dart';

void main() => runApp(const ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Google Wallet Button Demo',
      theme: ThemeData(useMaterial3: true),
      home: const ExampleScreen(),
    );
  }
}

class ExampleScreen extends StatelessWidget {
  const ExampleScreen({super.key});

  void _onPressed(String label) {
    debugPrint('$label tapped');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Google Wallet Button')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Add to Google Wallet — Primary'),
            const SizedBox(height: 8),
            AddToGoogleWalletButton(
              onPressed: () => _onPressed('Add to (primary)'),
            ),
            const SizedBox(height: 24),
            const Text('Add to Google Wallet — Condensed'),
            const SizedBox(height: 8),
            AddToGoogleWalletButton(
              onPressed: () => _onPressed('Add to (condensed)'),
              style: GoogleWalletButtonStyle.condensed,
            ),
            const SizedBox(height: 24),
            const Text('View in Google Wallet — Primary'),
            const SizedBox(height: 8),
            ViewInGoogleWalletButton(
              onPressed: () => _onPressed('View in (primary)'),
            ),
            const SizedBox(height: 24),
            const Text('View in Google Wallet — Condensed'),
            const SizedBox(height: 8),
            ViewInGoogleWalletButton(
              onPressed: () => _onPressed('View in (condensed)'),
              style: GoogleWalletButtonStyle.condensed,
            ),
            const SizedBox(height: 24),
            const Text('Locale override (German)'),
            const SizedBox(height: 8),
            AddToGoogleWalletButton(
              onPressed: () => _onPressed('Add to (de)'),
              locale: const Locale('de'),
            ),
            const SizedBox(height: 24),
            const Text('Custom height (60dp)'),
            const SizedBox(height: 8),
            AddToGoogleWalletButton(
              onPressed: () => _onPressed('Add to (height 60)'),
              height: 60,
            ),
            const SizedBox(height: 24),
            const Text('Disabled'),
            const SizedBox(height: 8),
            const AddToGoogleWalletButton(onPressed: null),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
