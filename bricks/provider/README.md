# Provider Feature Brick

A Mason brick for generating Flutter feature folders with Provider (ChangeNotifier) state management.

## Usage

This brick generates a complete feature structure using the Provider pattern with:
- ChangeNotifier for reactive state management
- Consumer widgets for efficient rebuilds
- Separation of concerns with domain layer
- Simple and intuitive API

## Requirements

Add these dependencies to your `pubspec.yaml`:

```yaml
dependencies:
  provider: ^6.1.2
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

## Usage Example

```dart
// In your app, wrap with MultiProvider
MultiProvider(
  providers: [
    ChangeNotifierProvider(create: (_) => FeatureProvider()),
  ],
  child: MyApp(),
)
```
