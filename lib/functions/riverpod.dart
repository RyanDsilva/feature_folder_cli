import 'dart:io';

import 'package:args/args.dart';
import 'package:mason/mason.dart';

import '../utils/directory.dart';
import '../utils/logs.dart';

/// Generates a feature folder structure with Riverpod state management.
///
/// [argResults] contains the command-line arguments:
/// - name: The feature name (required)
/// - path: Optional custom path within lib folder
/// - [dryRun] is a dev-only boolean to generate example folders
void generateRiverpod(
  ArgResults argResults, {
  bool dryRun = false,
}) async {
  final customPath = argResults['path'] != null;
  var dir = argResults['path'] ?? 'feature';
  if (dryRun) {
    dir = 'example';
  }

  try {
    final brick = Brick.git(
      GitPath(
        'https://github.com/RyanDsilva/feature_folder_cli',
        path: 'bricks/riverpod',
      ),
    );
    final generator = await MasonGenerator.fromBrick(brick);
    final target = DirectoryGeneratorTarget(
      Directory(
        customPath
            ? DirectoryService.replaceAsExpected(path: 'lib/$dir')
            : DirectoryService.paths[dir]!,
      ),
    );
    await generator.generate(
      target,
      vars: <String, dynamic>{'name': argResults['name'].toString()},
    );
    LogService.info('\nDon\'t forget to add these dependencies to pubspec.yaml:');
    LogService.info('dependencies:');
    LogService.info('  flutter_riverpod: ^2.6.1');
    LogService.info('  riverpod_annotation: ^2.6.1');
    LogService.info('  freezed_annotation: ^2.4.4');
    LogService.info('  json_annotation: ^4.9.0');
    LogService.info('\ndev_dependencies:');
    LogService.info('  riverpod_generator: ^2.6.2');
    LogService.info('  build_runner: ^2.4.13');
    LogService.info('  freezed: ^2.5.7');
    LogService.info('  json_serializable: ^6.8.0');
    LogService.info('\nRun: dart run build_runner build --delete-conflicting-outputs');
  } on Exception catch (e) {
    LogService.error(e.toString());
  }
}
