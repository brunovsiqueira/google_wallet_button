import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';
import 'package:google_wallet_button/src/locale_resolver.dart';

void main() {
  group('resolveAssetPath - add_to_wallet', () {
    test('exact match with language_COUNTRY', () {
      final path = resolveAssetPath(
        locale: const Locale('en', 'US'),
        buttonType: 'add_to_wallet',
        styleName: 'primary',
      );
      expect(path, 'assets/add_to_wallet/primary/en_US.svg');
    });

    test('language only match', () {
      final path = resolveAssetPath(
        locale: const Locale('de'),
        buttonType: 'add_to_wallet',
        styleName: 'primary',
      );
      expect(path, 'assets/add_to_wallet/primary/de.svg');
    });

    test('maps non-standard codes (ja → jp)', () {
      final path = resolveAssetPath(
        locale: const Locale('ja'),
        buttonType: 'add_to_wallet',
        styleName: 'primary',
      );
      expect(path, 'assets/add_to_wallet/primary/jp.svg');
    });

    test('maps non-standard codes (cs → cz)', () {
      final path = resolveAssetPath(
        locale: const Locale('cs'),
        buttonType: 'add_to_wallet',
        styleName: 'primary',
      );
      expect(path, 'assets/add_to_wallet/primary/cz.svg');
    });

    test('maps non-standard codes (da → dk)', () {
      final path = resolveAssetPath(
        locale: const Locale('da'),
        buttonType: 'add_to_wallet',
        styleName: 'primary',
      );
      expect(path, 'assets/add_to_wallet/primary/dk.svg');
    });

    test('maps non-standard codes (sv → se)', () {
      final path = resolveAssetPath(
        locale: const Locale('sv'),
        buttonType: 'add_to_wallet',
        styleName: 'primary',
      );
      expect(path, 'assets/add_to_wallet/primary/se.svg');
    });

    test('falls back to en_US for unsupported locale', () {
      final path = resolveAssetPath(
        locale: const Locale('xx'),
        buttonType: 'add_to_wallet',
        styleName: 'primary',
      );
      expect(path, 'assets/add_to_wallet/primary/en_US.svg');
    });

    test('condensed style uses correct directory', () {
      final path = resolveAssetPath(
        locale: const Locale('fr', 'FR'),
        buttonType: 'add_to_wallet',
        styleName: 'condensed',
      );
      expect(path, 'assets/add_to_wallet/condensed/fr_FR.svg');
    });

    test('language fallback when country not found', () {
      // de_AT is not available but de is
      final path = resolveAssetPath(
        locale: const Locale('de', 'AT'),
        buttonType: 'add_to_wallet',
        styleName: 'primary',
      );
      expect(path, 'assets/add_to_wallet/primary/de.svg');
    });
  });

  group('resolveAssetPath - view_in_wallet', () {
    test('exact match', () {
      final path = resolveAssetPath(
        locale: const Locale('en', 'AU'),
        buttonType: 'view_in_wallet',
        styleName: 'primary',
      );
      expect(path, 'assets/view_in_wallet/primary/en_AU.svg');
    });

    test('language only match', () {
      final path = resolveAssetPath(
        locale: const Locale('ja'),
        buttonType: 'view_in_wallet',
        styleName: 'primary',
      );
      expect(path, 'assets/view_in_wallet/primary/ja.svg');
    });

    test('maps he → iw', () {
      final path = resolveAssetPath(
        locale: const Locale('he'),
        buttonType: 'view_in_wallet',
        styleName: 'primary',
      );
      expect(path, 'assets/view_in_wallet/primary/iw.svg');
    });

    test('falls back to en_AU for unsupported locale', () {
      final path = resolveAssetPath(
        locale: const Locale('xx'),
        buttonType: 'view_in_wallet',
        styleName: 'primary',
      );
      expect(path, 'assets/view_in_wallet/primary/en_AU.svg');
    });

    test('pt_BR exact match', () {
      final path = resolveAssetPath(
        locale: const Locale('pt', 'BR'),
        buttonType: 'view_in_wallet',
        styleName: 'condensed',
      );
      expect(path, 'assets/view_in_wallet/condensed/pt_BR.svg');
    });
  });
}
