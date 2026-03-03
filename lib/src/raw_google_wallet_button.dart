import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'google_wallet_button_style.dart';
import 'locale_resolver.dart';

/// Default height for primary (full-width) buttons.
const _kPrimaryHeight = 48.0;

/// Default height for condensed (badge) buttons.
const _kCondensedHeight = 55.0;

/// Opacity applied when the button is disabled.
const _kDisabledOpacity = 0.38;

/// Shared base widget for Google Wallet buttons.
///
/// Handles locale resolution, SVG asset loading, sizing, tap handling,
/// semantics, and disabled state.
class RawGoogleWalletButton extends StatelessWidget {
  const RawGoogleWalletButton({
    super.key,
    required this.onPressed,
    required this.buttonType,
    this.style = GoogleWalletButtonStyle.primary,
    this.locale,
    this.height,
    required this.semanticLabel,
  });

  /// Called when the button is tapped. If null, the button is disabled.
  final VoidCallback? onPressed;

  /// The button type, either `'add_to_wallet'` or `'view_in_wallet'`.
  final String buttonType;

  /// The visual style of the button.
  final GoogleWalletButtonStyle style;

  /// Override the locale used to select the button asset.
  /// If null, the locale is resolved from the ambient [Localizations].
  final Locale? locale;

  /// Override the button height. Width is derived from the SVG aspect ratio.
  final double? height;

  /// The semantic label for accessibility.
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    final effectiveLocale = locale ?? Localizations.localeOf(context);
    final styleName =
        style == GoogleWalletButtonStyle.primary ? 'primary' : 'condensed';
    final assetPath = resolveAssetPath(
      locale: effectiveLocale,
      buttonType: buttonType,
      styleName: styleName,
    );
    final effectiveHeight =
        height ??
        (style == GoogleWalletButtonStyle.primary
            ? _kPrimaryHeight
            : _kCondensedHeight);

    final bool enabled = onPressed != null;

    Widget svg = SvgPicture.asset(
      assetPath,
      package: 'google_wallet_button',
      height: effectiveHeight,
      fit: BoxFit.contain,
    );

    if (!enabled) {
      svg = Opacity(opacity: _kDisabledOpacity, child: svg);
    }

    return Semantics(
      button: true,
      enabled: enabled,
      label: semanticLabel,
      child: GestureDetector(onTap: onPressed, child: svg),
    );
  }
}
