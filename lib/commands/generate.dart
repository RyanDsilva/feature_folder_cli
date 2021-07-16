import 'package:args/command_runner.dart';

import '../samples/implementations/index.dart';
import '../utils/directory.dart';
import '../utils/logs.dart';

class GenerateCommand extends Command {
  final String _name = 'generate';
  final String _description =
      'Generate folders and files according to folder by feature structure.';

  GenerateCommand() {
    argParser.addOption(
      'name',
      abbr: 'n',
      mandatory: true,
      help: 'Name of the feature to be created.',
    );
  }

  @override
  String get description => _description;

  @override
  String get name => _name;

  @override
  void run() {
    SampleScreen(
      DirectoryService.paths['example']!,
      argResults!['name'].toString(),
    )..create();
    SampleWidget(
      DirectoryService.paths['example']!,
      argResults!['name'].toString(),
    )..create();
    SampleModel(
      DirectoryService.paths['example']!,
      argResults!['name'].toString(),
    )..create();
    LogService.success('Feature ${argResults!['name']} created successfully');
  }
}
