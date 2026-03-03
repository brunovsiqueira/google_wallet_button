import 'dart:ui';

/// Maps from standard Dart locale codes to the non-standard codes Google uses
/// in the add-to-wallet SVG asset filenames.
///
/// For example, Google uses 'jp' (a country code) instead of 'ja' (the correct
/// ISO 639-1 language code for Japanese).
const _addToWalletCodeMapping = <String, String>{
  'cs': 'cz',
  'da': 'dk',
  'el': 'gr',
  'fi': 'fl',
  'ja': 'jp',
  'km': 'kh',
  'pt_BR': 'br',
  'be': 'by',
  'sv': 'se',
  'fil': 'fp',
};

/// The set of asset filename stems available for add-to-wallet buttons.
const _addToWalletLocales = <String>{
  'af',
  'am',
  'ar',
  'az',
  'bg',
  'bn',
  'br',
  'bs',
  'by',
  'ca',
  'cz',
  'de',
  'dk',
  'en_AU',
  'en_CA',
  'en_GB',
  'en_IN',
  'en_SG',
  'en_US',
  'en_ZA',
  'es_419',
  'es_ES',
  'es_US',
  'et',
  'fa',
  'fl',
  'fp',
  'fr_CA',
  'fr_FR',
  'gr',
  'he',
  'hr',
  'hu',
  'hy',
  'id',
  'is',
  'it',
  'jp',
  'ka',
  'kh',
  'kk',
  'ky',
  'lo',
  'lt',
  'lv',
  'mk',
  'mn',
  'my',
  'ne',
  'nl',
  'no',
  'pl',
  'pt',
  'ro',
  'ru',
  'se',
  'si',
  'sk',
  'sl',
  'sq',
  'sr',
  'sw',
  'th',
  'tr',
  'uk',
  'ur',
  'uz',
  'vi',
  'zh_HK',
  'zh_TW',
};

/// Maps from standard Dart locale codes to the codes Google uses in the
/// view-in-wallet SVG asset filenames.
const _viewInWalletCodeMapping = <String, String>{
  'he': 'iw',
  'zh_CN': 'zh_cn',
  'am_ET': 'am_et',
  'gu_IN': 'gu_in',
  'ur': 'ur_PK',
};

/// The set of asset filename stems available for view-in-wallet buttons.
const _viewInWalletLocales = <String>{
  'af',
  'am_et',
  'ar',
  'az',
  'bg',
  'bn',
  'ca',
  'cs',
  'da',
  'de',
  'el',
  'en_AU',
  'en_GB',
  'es',
  'es_419',
  'et',
  'eu',
  'fi',
  'fil',
  'fr',
  'fr_CA',
  'gl',
  'gu_in',
  'hi',
  'hr',
  'hu',
  'hy',
  'id',
  'is',
  'it',
  'iw',
  'ja',
  'ka',
  'kk',
  'km',
  'kn',
  'ko',
  'ky',
  'lo',
  'lt',
  'lv',
  'mk',
  'ml',
  'mn',
  'mr',
  'ms',
  'my',
  'ne',
  'nl',
  'no',
  'pa',
  'pl',
  'pt_BR',
  'pt_PT',
  'ro',
  'ru',
  'si',
  'sk',
  'sl',
  'sq',
  'sr',
  'sv',
  'sw',
  'ta',
  'te',
  'th',
  'tr',
  'uk',
  'ur_PK',
  'uz',
  'vi',
  'zh_HK',
  'zh_TW',
  'zh_cn',
  'zu',
};

const _addToWalletFallback = 'en_US';
const _viewInWalletFallback = 'en_AU';

/// Resolves a [Locale] to the SVG asset path for the given button type and
/// style.
///
/// The [buttonType] is either `'add_to_wallet'` or `'view_in_wallet'`.
///
/// Resolution order:
/// 1. Exact match with language_COUNTRY (applying code mappings)
/// 2. Language-only match (applying code mappings)
/// 3. English fallback
String resolveAssetPath({
  required Locale locale,
  required String buttonType,
  required String styleName,
}) {
  final isAddTo = buttonType == 'add_to_wallet';
  final locales = isAddTo ? _addToWalletLocales : _viewInWalletLocales;
  final codeMapping =
      isAddTo ? _addToWalletCodeMapping : _viewInWalletCodeMapping;
  final fallback = isAddTo ? _addToWalletFallback : _viewInWalletFallback;

  final code = _resolveCode(locale, locales, codeMapping) ?? fallback;
  return 'assets/$buttonType/$styleName/$code.svg';
}

String? _resolveCode(
  Locale locale,
  Set<String> available,
  Map<String, String> codeMapping,
) {
  final lang = locale.languageCode;
  final country = locale.countryCode;

  // Try exact match with language_COUNTRY first.
  if (country != null && country.isNotEmpty) {
    final exact = '${lang}_$country';

    // Check mapped code.
    final mapped = codeMapping[exact];
    if (mapped != null && available.contains(mapped)) return mapped;

    // Check as-is.
    if (available.contains(exact)) return exact;
  }

  // Try language-only.
  final mappedLang = codeMapping[lang];
  if (mappedLang != null && available.contains(mappedLang)) return mappedLang;
  if (available.contains(lang)) return lang;

  return null;
}
