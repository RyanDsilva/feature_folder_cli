# Riverpod Feature Brick

A Mason brick for generating Flutter feature folders with Riverpod state management.

## Usage

This brick generates a complete feature structure using Riverpod 3.x with:
- Code generation with riverpod_generator
- Type-safe providers
- AsyncValue for loading/error states
- Freezed for immutable models

## Requirements

Add these dependencies to your `pubspec.yaml`:

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

## Code Generation

After generating the feature, run:

```bash
dart run build_runner build --delete-conflicting-outputs
```

## Generated Structure

```
feature_name/
├── providers/
│   ├── feature_name_provider.dart
│   └── index.dart
├── domain/
│   ├── models/
│   ├── repository/
│   ├── services/
│   └── index.dart
├── screens/
├── widgets/
└── index.dart
```
