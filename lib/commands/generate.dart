import 'package:args/command_runner.dart';

import '../functions/index.dart';
import '../utils/logs.dart';

/// [GenerateCommand] is used to generate new files for a feature
class GenerateCommand extends Command {
  final String _name = 'generate';
  final String _description =
      'Generate folders and files according to folder by feature structure.';

  /// Constructor for the generate files command
  ///
  /// [name] is a required argument that represents the name of the feature
  /// to be created
  ///
  /// [type] is a required argument that represents the type of the feature
  /// to be created
  ///
  /// [path] is an optional argument that represents the path of the feature
  /// to be created inside the lib folder
  GenerateCommand() {
    argParser.addOption(
      'name',
      abbr: 'n',
      mandatory: true,
      help: 'Name of the feature to be created',
    );
    argParser.addOption(
      'type',
      abbr: 't',
      mandatory: true,
      help: 'Type of feature:\n'
          '[simple] Simple\n'
          '[getx] GetX\n'
          '[bloc] BLoC\n'
          '[cubit] Cubit\n'
          '[riverpod] Riverpod\n'
          '[provider] Provider',
    );
    argParser.addOption(
      'path',
      abbr: 'p',
      mandatory: false,
      help: 'Path inside lib folder',
    );
  }

  @override
  String get description => _description;

  @override
  String get name => _name;

  @override
  void run() {
    final name = argResults!['name'].toString();
    final type = argResults!['type'].toString();

    // Validate name (lowercase only)
    if (name.toLowerCase() != name || name.contains(RegExp(r'[^a-z_]'))) {
      LogService.error(
        'Feature name must be lowercase and contain only letters and underscores',
      );
      return;
    }

    final time = Stopwatch();
    time.start();

    switch (type) {
      case 'simple':
        generateSimple(argResults!);
      case 'getx':
        generateGetX(argResults!);
      case 'bloc':
        generateBloc(argResults!);
      case 'cubit':
        generateCubit(argResults!);
      case 'riverpod':
        generateRiverpod(argResults!);
      case 'provider':
        generateProvider(argResults!);
      default:
        LogService.error(
          'Invalid type: $type\n'
          'Valid types: simple, getx, bloc, cubit, riverpod, provider',
        );
        return;
    }

    time.stop();
    LogService.info('Time Taken: ${time.elapsed.inMilliseconds} milliseconds');
    LogService.success('Feature $name created successfully with $type state management');
  }
}
