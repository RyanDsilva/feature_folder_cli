import 'dart:io';

import 'package:args/command_runner.dart';

import 'commands/generate.dart';

class FeatureFolderCLI {
  static void main(List<String> args) {
    final _runner = CommandRunner('ff', 'Generate folder by feature structure.')
      ..addCommand(GenerateCommand());
    _runner.run(args).catchError((err) {
      if (err is! UsageException) {
        throw UsageException(
          'Invalid Usage',
          'Use the -h flag to view instructions on how to use this CLI.',
        );
      }
      exit(64);
    });
  }
}
