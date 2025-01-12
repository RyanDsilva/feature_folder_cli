import 'package:mason/mason.dart';

Future<void> run(HookContext context) async {
  final logger = context.logger;

  // Check if `bloc` and `flutter_bloc` are already in pubspec.yaml
  final pubspecFile = File('pubspec.yaml');
  if (!await pubspecFile.exists()) {
    logger.err('pubspec.yaml not found.');
    return;
  }

  String pubspecContent = await pubspecFile.readAsString();

  const dependencies = [
    'bloc: ^8.0.0',
    'flutter_bloc: ^8.0.0',
    'equatable: ^2.0.0',
    'data_provider:',
  ];

  bool needsUpdate = false;

  for (final dependency in dependencies) {
    if (!pubspecContent.contains(dependency)) {
      needsUpdate = true;
      break;
    }
  }

  if (needsUpdate) {
    logger.info('Adding dependencies to pubspec.yaml...');
    pubspecContent = pubspecContent.replaceFirst(
      '\ndependencies:',
      '\ndependencies:\n  bloc: ^8.0.0\n  flutter_bloc: ^8.0.0\n  equatable: ^2.0.0\n  data_provider:\n    path: ./packages/data_provider',
    );
    await pubspecFile.writeAsString(pubspecContent);
    logger.info('Dependencies added successfully.');
  } else {
    logger.info('Dependencies already exist in pubspec.yaml.');
  }
}
