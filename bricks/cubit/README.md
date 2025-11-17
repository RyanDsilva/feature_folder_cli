# Cubit Feature Brick

A Mason brick for generating Flutter feature folders with Cubit state management.

## Usage

This brick generates a complete feature structure using the Cubit pattern with:
- Simplified BLoC pattern (no events)
- Direct state emission
- Testable business logic
- Type-safe state management
- Modern Dart 3 features (pattern matching, switch expressions)

## Requirements

Add these dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  flutter_bloc: ^8.1.6
  equatable: ^2.0.5
```

## Generated Structure

```
feature_name/
├── cubit/
│   ├── feature_name_cubit.dart
│   ├── feature_name_state.dart
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

## Key Differences from BLoC

- No events - call methods directly on the Cubit
- Less boilerplate than BLoC
- Simpler for straightforward state management
- Still provides full BLoC architecture benefits
