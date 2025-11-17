import 'dart:io';

import 'package:args/args.dart';
import 'package:mason/mason.dart';

import '../utils/directory.dart';
import '../utils/logs.dart';

/// Generates a feature folder structure with Provider (ChangeNotifier) state management.
///
/// [argResults] contains the command-line arguments:
/// - name: The feature name (required)
/// - path: Optional custom path within lib folder
/// - [dryRun] is a dev-only boolean to generate example folders
void generateProvider(
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
        path: 'bricks/provider',
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
    LogService.info('\nDon\'t forget to add this dependency to pubspec.yaml:');
    LogService.info('  provider: ^6.1.2');
  } on Exception catch (e) {
    LogService.error(e.toString());
  }
}
