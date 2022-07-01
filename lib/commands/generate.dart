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
  GenerateCommand() {
    argParser.addOption(
      'name',
      abbr: 'n',
      mandatory: true,
      help: 'Name of the feature to be created.',
    );
    argParser.addOption(
      'type',
      abbr: 't',
      mandatory: true,
      help: 'Type of feature:\n[simple] Simple\n[getx] GetX',
    );
  }

  @override
  String get description => _description;

  @override
  String get name => _name;

  @override
  void run() {
    final time = Stopwatch();
    time.start();
    switch (argResults!['type'].toString()) {
      case 'simple':
        generateSimple(argResults!);
        break;
      case 'getx':
        generateGetX(argResults!);
        break;
      default:
        LogService.error('Invalid Arguments');
        break;
    }
    time.stop();
    LogService.info('Time Taken: ${time.elapsed.inMilliseconds} milliseconds');
    LogService.success('Feature ${argResults!['name']} created successfully');
  }
}
