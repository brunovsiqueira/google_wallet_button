import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_wallet_button/google_wallet_button.dart';

void main() {
  group('AddToGoogleWalletButton', () {
    testWidgets('renders and responds to taps', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AddToGoogleWalletButton(onPressed: () => tapped = true),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final finder = find.byType(AddToGoogleWalletButton);
      expect(finder, findsOneWidget);

      await tester.tap(finder);
      expect(tapped, isTrue);
    });

    testWidgets('disabled state does not fire callback', (tester) async {
      var tapped = false;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: AddToGoogleWalletButton(onPressed: null)),
        ),
      );

      await tester.pumpAndSettle();

      await tester.tap(find.byType(AddToGoogleWalletButton));
      expect(tapped, isFalse);
    });

    testWidgets('disabled state has reduced opacity', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: AddToGoogleWalletButton(onPressed: null)),
        ),
      );

      await tester.pumpAndSettle();

      final opacity = tester.widget<Opacity>(find.byType(Opacity));
      expect(opacity.opacity, 0.38);
    });

    testWidgets('has correct semantic label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(body: AddToGoogleWalletButton(onPressed: () {})),
        ),
      );

      await tester.pumpAndSettle();

      final semantics = tester.getSemantics(
        find.byType(AddToGoogleWalletButton),
      );
      expect(semantics.label, 'Add to Google Wallet');
    });

    testWidgets('custom semantic label', (tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: AddToGoogleWalletButton(
              onPressed: () {},
              semanticLabel: 'Custom label',
            ),
          ),
        ),
      );

      await tester.pumpAndSettle();

      final semantics = tester.getSemantics(
        find.byType(AddToGoogleWalletButton),
      );
      expect(semantics.label, 'Custom label');
    });
  });
}
