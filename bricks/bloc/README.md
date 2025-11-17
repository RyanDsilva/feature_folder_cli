# BLoC Feature Brick

A Mason brick for generating Flutter feature folders with BLoC state management.

## Usage

This brick generates a complete feature structure using the BLoC pattern with:
- Event-driven architecture
- Separation of concerns
- Testable business logic
- Type-safe state management

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
├── bloc/
│   ├── feature_name_bloc.dart
│   ├── feature_name_event.dart
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
