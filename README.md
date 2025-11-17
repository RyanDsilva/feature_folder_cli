# Feature Folder CLI

[![pub package](https://img.shields.io/pub/v/feature_folder_cli.svg)](https://pub.dev/packages/feature_folder_cli)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

A powerful Dart CLI tool that generates feature folder structures following the folder-by-feature pattern with support for multiple state management solutions. This tool significantly reduces the repetitive work required to set up directories for models, services, repositories, screens, and widgets in Flutter projects.

## Features

- **Multiple State Management Solutions**: Support for 6 different state management approaches
- **Consistent Architecture**: Enforces clean architecture with domain layer separation
- **Modern Dart 3**: Uses latest Dart features (records, pattern matching, sealed classes)
- **Production Ready**: Includes proper error handling, logging, and validation
- **Flexible**: Customizable output paths and feature names
- **Fast**: Quick scaffolding to get you coding faster

## Supported State Management Solutions

| Type | Description | Best For | Requires |
|------|-------------|----------|----------|
| **simple** | Basic state management | Small projects, learning | None |
| **provider** | ChangeNotifier with Provider | Medium apps, Flutter-endorsed | `provider` |
| **getx** | GetX reactive state | Rapid development | `get` |
| **bloc** | BLoC pattern with events | Enterprise, complex logic | `flutter_bloc`, `equatable` |
| **cubit** | Simplified BLoC | Medium complexity | `flutter_bloc`, `equatable` |
| **riverpod** | Modern, compile-safe | Scalable apps, best practices | `flutter_riverpod`, `riverpod_annotation` |

## Installation

Activate globally:

```bash
dart pub global activate feature_folder_cli
```

## Usage

Navigate to your Flutter project root and run:

```bash
ff generate -n <feature_name> -t <type> [-p <path>]
```

### Arguments

- `-n, --name` **(required)**: Feature name in lowercase with underscores only (e.g., `user_profile`)
- `-t, --type` **(required)**: State management type (`simple`, `getx`, `bloc`, `cubit`, `riverpod`, `provider`)
- `-p, --path` **(optional)**: Custom path within the `lib` folder (default: `lib/feature`)

### Examples

```bash
# Generate a simple feature
ff generate -n user_auth -t simple

# Generate with BLoC in custom path
ff generate -n product_catalog -t bloc -p features/ecommerce

# Generate with Riverpod
ff generate -n shopping_cart -t riverpod -p features

# Generate with Provider
ff generate -n settings -t provider
```

## Generated Structure

All state management types generate a consistent folder structure:

```
feature_name/
├── domain/
│   ├── models/
│   │   ├── feature_name_model.dart
│   │   └── index.dart
│   ├── repository/
│   │   ├── feature_name_repository.dart
│   │   └── index.dart
│   ├── services/
│   │   ├── feature_name_service.dart
│   │   └── index.dart
│   └── index.dart
├── screens/
│   ├── feature_name_screen.dart
│   └── index.dart
├── widgets/
│   ├── feature_name_component.dart
│   └── index.dart
├── [state_folder]/          # bloc, cubit, providers, etc.
│   ├── ...
│   └── index.dart
└── index.dart
```

### State-Specific Folders

- **simple/getx/provider**: `providers/` folder with provider/controller
- **bloc**: `bloc/` folder with bloc, events, and states
- **cubit**: `cubit/` folder with cubit and states
- **riverpod**: `providers/` folder with Riverpod providers (requires code generation)

## Dependencies Required

After generating features, add the required dependencies to your `pubspec.yaml`:

### BLoC / Cubit
```yaml
dependencies:
  flutter_bloc: ^8.1.6
  equatable: ^2.0.5
```

### Riverpod
```yaml
dependencies:
  flutter_riverpod: ^2.6.1
  riverpod_annotation: ^2.6.1
  freezed_annotation: ^2.4.4
  json_annotation: ^4.9.0

dev_dependencies:
  riverpod_generator: ^2.6.2
  build_runner: ^2.4.13
  freezed: ^2.5.7
  json_serializable: ^6.8.0
```

Then run:
```bash
dart run build_runner build --delete-conflicting-outputs
```

### Provider
```yaml
dependencies:
  provider: ^6.1.2
```

### GetX
```yaml
dependencies:
  get: ^4.6.6
```

## State Management Quick Comparison

### When to Use Each

**Simple**: Learning Flutter or building a small app without complex state needs.

**Provider**: Official Flutter recommendation, medium-sized apps, familiar with ChangeNotifier pattern.

**GetX**: Rapid development, prefer minimal boilerplate, all-in-one solution (routing + state + DI).

**BLoC**: Large teams, enterprise apps, prefer event-driven architecture, extensive business logic.

**Cubit**: Want BLoC benefits with less boilerplate, straightforward state management without events.

**Riverpod**: Modern scalable apps, want compile-time safety, best practices, excellent DevTools integration.

## Architecture Principles

The generated code follows clean architecture principles:

- **Domain Layer**: Business logic, models, repositories (abstract), services
- **Presentation Layer**: Screens, widgets, state management
- **Separation of Concerns**: Each layer has a specific responsibility
- **Testability**: Easy to unit test business logic separately from UI

## Modern Dart Features

The generated code uses Dart 3+ features:

- **Pattern Matching**: Switch expressions in BLoC/Cubit screens
- **Records**: Available for data grouping
- **Sealed Classes**: For exhaustive state handling
- **Super Parameters**: `super.key` instead of `Key? key`
- **Const Constructors**: For better performance

## Requirements

- Dart SDK: `^3.6.0`
- Flutter: `>=3.38.0` (for generated Flutter code)

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Author

**Ryan D'silva** - [GitHub](https://github.com/RyanDsilva/feature_folder_cli)

## Changelog

See [CHANGELOG.md](CHANGELOG.md) for version history.

## Support

If you find this package helpful, please give it a star on [GitHub](https://github.com/RyanDsilva/feature_folder_cli) and like it on [pub.dev](https://pub.dev/packages/feature_folder_cli).

For issues and feature requests, please file them in the [GitHub issue tracker](https://github.com/RyanDsilva/feature_folder_cli/issues).
