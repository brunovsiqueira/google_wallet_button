import 'package:flutter/widgets.dart';

import 'google_wallet_button_style.dart';
import 'raw_google_wallet_button.dart';

/// A button that displays the official "View in Google Wallet" branding.
///
/// The button automatically selects the correct localized SVG asset based on
/// the ambient locale, or a manually specified [locale].
///
/// {@tool snippet}
/// ```dart
/// ViewInGoogleWalletButton(
///   onPressed: () {
///     // Deep link to saved pass in Google Wallet
///   },
/// )
/// ```
/// {@end-tool}
class ViewInGoogleWalletButton extends StatelessWidget {
  const ViewInGoogleWalletButton({
    super.key,
    required this.onPressed,
    this.style = GoogleWalletButtonStyle.primary,
    this.locale,
    this.height,
    this.semanticLabel = 'View in Google Wallet',
  });

  /// Called when the button is tapped. Pass null to disable the button.
  final VoidCallback? onPressed;

  /// The visual style of the button.
  ///
  /// Defaults to [GoogleWalletButtonStyle.primary].
  final GoogleWalletButtonStyle style;

  /// Override the locale used to select the button asset.
  ///
  /// If null, the locale is resolved from the ambient [Localizations].
  final Locale? locale;

  /// Override the button height. Width is derived from the SVG aspect ratio.
  final double? height;

  /// The semantic label for accessibility.
  ///
  /// Defaults to `'View in Google Wallet'`.
  final String semanticLabel;

  @override
  Widget build(BuildContext context) {
    return RawGoogleWalletButton(
      onPressed: onPressed,
      buttonType: 'view_in_wallet',
      style: style,
      locale: locale,
      height: height,
      semanticLabel: semanticLabel,
    );
  }
}
