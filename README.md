# google_wallet_button

Unofficial Flutter widgets for **"Add to Google Wallet"** and **"View in Google Wallet"** buttons with automatic locale detection and official branding assets.

Inspired by official compose counterpat https://github.com/google-wallet/compose-wallet-button.

## Features

- Two button types: `AddToGoogleWalletButton` and `ViewInGoogleWalletButton`
- Two styles per type: `primary` (full-width) and `condensed` (badge)
- ~70 localized SVG assets for "Add to" and ~75 for "View in"
- Automatic locale detection from ambient `Localizations`
- Manual locale override possible (`locale` parameter)
- Custom height (width derived from aspect ratio)
- Disabled state (pass `null` to `onPressed`)
- Accessibility via `Semantics`

## Installation

```yaml
dependencies:
  google_wallet_button: ^0.1.0
```

## Usage

### Add to Google Wallet

```dart
import 'package:google_wallet_button/google_wallet_button.dart';

// Default — auto-detects locale from context
AddToGoogleWalletButton(
  onPressed: () {
    // Save pass to Google Wallet
  },
)

// Condensed badge style
AddToGoogleWalletButton(
  onPressed: () { /* ... */ },
  style: GoogleWalletButtonStyle.condensed,
)

// Manual locale override
AddToGoogleWalletButton(
  onPressed: () { /* ... */ },
  locale: const Locale('de'),
)

// Custom height
AddToGoogleWalletButton(
  onPressed: () { /* ... */ },
  height: 60,
)

// Disabled
AddToGoogleWalletButton(
  onPressed: null,
)
```

### View in Google Wallet

```dart
ViewInGoogleWalletButton(
  onPressed: () {
    // Deep link to saved pass
  },
)
```

## Supported locales

### Add to Google Wallet

af, am, ar, az, bg, bn, bs, by, ca, cs, da, de, el, en_AU, en_CA, en_GB, en_IN, en_SG, en_US, en_ZA, es_419, es_ES, es_US, et, fa, fi, fil, fr_CA, fr_FR, he, hr, hu, hy, id, is, it, ja, ka, km, kk, ky, lo, lt, lv, mk, mn, my, ne, nl, no, pl, pt, pt_BR, ro, ru, si, sk, sl, sq, sr, sv, sw, th, tr, uk, ur, uz, vi, zh_HK, zh_TW

### View in Google Wallet

af, am_ET, ar, az, bg, bn, ca, cs, da, de, el, en_AU, en_GB, es, es_419, et, eu, fi, fil, fr, fr_CA, gl, gu_IN, hi, hr, hu, hy, id, is, it, he, ja, ka, kk, km, kn, ko, ky, lo, lt, lv, mk, ml, mn, mr, ms, my, ne, nl, no, pa, pl, pt_BR, pt_PT, ro, ru, si, sk, sl, sq, sr, sv, sw, ta, te, th, tr, uk, ur_PK, uz, vi, zh_CN, zh_HK, zh_TW, zu

## Branding guidelines

Please follow the [Google Wallet brand guidelines](https://developers.google.com/wallet/generic/resources/brand-guidelines) when using these buttons.

## License

Apache 2.0. See [LICENSE](LICENSE).

The Google Wallet button SVG assets are provided by Google and are subject to Google's branding guidelines.
