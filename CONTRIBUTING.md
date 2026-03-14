# Contributing to google_wallet_button

Thank you for considering contributing! This project is open to contributions of all kinds — bug reports, feature requests, documentation improvements, and code changes.

## Getting started

1. Fork the repository
2. Clone your fork:
   ```bash
   git clone https://github.com/<your-username>/google_wallet_button.git
   ```
3. Install dependencies:
   ```bash
   flutter pub get
   ```
4. Create a branch for your change:
   ```bash
   git checkout -b my-change
   ```

## Development

### Running tests

```bash
flutter test
```

### Running analysis

```bash
flutter analyze
```

### Formatting

```bash
dart format .
```

All code must pass `flutter analyze` with no issues and be formatted with `dart format` before submitting a PR.

## Submitting changes

1. Commit your changes with a clear, descriptive commit message
2. Push to your fork
3. Open a pull request against `main`
4. Describe what your change does and why

## Reporting bugs

Open an [issue](https://github.com/brunovsiqueira/google_wallet_button/issues) with:

- A clear title and description
- Steps to reproduce
- Expected vs actual behavior
- Flutter version (`flutter --version`)

## Feature requests

Open an [issue](https://github.com/brunovsiqueira/google_wallet_button/issues) describing the feature and the use case.

## Guidelines

- Keep changes focused — one PR per concern
- Follow existing code style and conventions
- Add tests for new functionality
- Do not modify the SVG assets — they are official Google branding assets and must remain unaltered per [Google Wallet brand guidelines](https://developers.google.com/wallet/generic/resources/brand-guidelines)

## License

By contributing, you agree that your contributions will be licensed under the [Apache 2.0 License](LICENSE).
