# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-11-17

### Added
- **New State Management Support**:
  - BLoC pattern with events and states
  - Cubit (simplified BLoC)
  - Riverpod with code generation support
  - Provider with ChangeNotifier

- **Modern Dart 3 Features**:
  - Pattern matching in generated screens
  - Switch expressions for state handling
  - Super parameters (`super.key`)
  - Const constructors throughout
  - Modern syntax and best practices

- **Enhanced Developer Experience**:
  - Input validation for feature names
  - Helpful dependency information after generation
  - Improved error messages
  - Better logging with colored output
  - Build time reporting

- **Production-Ready Features**:
  - Comprehensive linting with `lints` package
  - Proper error handling
  - Code generation instructions for Riverpod
  - Type-safe state management patterns

- **Documentation**:
  - Comprehensive README with examples
  - Individual README files for each brick
  - Detailed state management comparison
  - Clear dependency requirements

### Changed
- **Breaking**: Updated to Dart SDK `^3.6.0` (was `>=2.18.0 <4.0.0`)
- **Breaking**: Updated to Flutter `>=3.38.0` (was `>=3.3.0`)
- Updated all dependencies to latest versions:
  - `args: ^2.6.0` (was `^2.4.1`)
  - `mason: ^0.1.0-dev.58` (was `0.1.0-dev.49`)
  - `path: ^1.9.0` (was `^1.8.2`)
  - `ansicolor: ^2.0.3` (was `^2.0.1`)
  - `test: ^1.25.10` (was `^1.24.3`)
- Added `lints: ^5.1.1` for better code quality
- Improved command-line help text with all available types
- Enhanced generated models with Equatable support (BLoC/Cubit)
- Enhanced generated models with Freezed support (Riverpod)
- Updated brick templates to version 2.0.0

### Fixed
- Key constructor parameters now use `super.key` instead of `Key? key`
- Better path handling for custom directories
- Improved error messages for invalid arguments

## [0.3.0] - Previous Release

### Changed
- Updated dependencies and SDK version
- Added more documentation

## [0.2.0] - Previous Release

### Changed
- Changed to use GitPath for bricks
- Converted simple structure to use bricks

## [0.1.1] - Previous Release

### Added
- Added GetX support
- Adopted Mason bricks architecture

## [0.0.4] - Initial Release

### Added
- Initial features - screen/widget generation
- Models, repositories, services support
- Simple state management pattern

[1.0.0]: https://github.com/RyanDsilva/feature_folder_cli/compare/v0.3.0...v1.0.0
[0.3.0]: https://github.com/RyanDsilva/feature_folder_cli/compare/v0.2.0...v0.3.0
[0.2.0]: https://github.com/RyanDsilva/feature_folder_cli/compare/v0.1.1...v0.2.0
[0.1.1]: https://github.com/RyanDsilva/feature_folder_cli/compare/v0.0.4...v0.1.1
[0.0.4]: https://github.com/RyanDsilva/feature_folder_cli/releases/tag/v0.0.4
