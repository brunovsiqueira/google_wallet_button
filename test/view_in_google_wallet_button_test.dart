import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_wallet_button/google_wallet_button.dart';

void main() {
  group('ViewInGoogleWalletButton', () {
    testWidgets('renders and responds to taps', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ViewInGoogleWalletButton(onPressed: () => tapped = true),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final finder = find.byType(ViewInGoogleWalletButton);
      expect(finder, findsOneWidget);

      await tester.tap(finder);
      expect(tapped, isTrue);
    });

    testWidgets('disabled state does not fire callback', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ViewInGoogleWalletButton(onPressed: null)),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(ViewInGoogleWalletButton));
      expect(tapped, isFalse);
    });

    testWidgets('has correct semantic label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: ViewInGoogleWalletButton(onPressed: () {})),
        ),
      );

      await tester.pumpAndSettle();

      final semantics = tester.getSemantics(
        find.byType(ViewInGoogleWalletButton),
      );
      expect(semantics.label, 'View in Google Wallet');
    });

    testWidgets('condensed style renders', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: ViewInGoogleWalletButton(
              onPressed: () {},
              style: GoogleWalletButtonStyle.condensed,
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();
      expect(find.byType(ViewInGoogleWalletButton), findsOneWidget);
    });
  });
}
