import 'dart:io';

import 'package:args/command_runner.dart';

import 'commands/generate.dart';
import 'utils/logs.dart';

/// [FeatureFolderCLI] is the main class containing the command runner
/// and its initialization code
/// 
/// This serves as the cli entry point
class FeatureFolderCLI {
  static void main(List<String> args) {
    final time = Stopwatch();
    time.start();
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
    time.stop();
    LogService.info('Time Taken: ${time.elapsed.inMilliseconds} milliseconds');
  }
}
