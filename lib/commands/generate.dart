import 'package:args/command_runner.dart';

import '../samples/implementations/index.dart';
import '../utils/directory.dart';
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
    _generateItems(dryRun: true);
    LogService.success('Feature ${argResults!['name']} created successfully');
  }

  void _generateItems({bool dryRun = false}) {
    var dir = 'feature';
    if (dryRun) {
      dir = 'example';
    }
    SampleScreen(
      DirectoryService.paths[dir]!,
      argResults!['name'].toString(),
    )
      ..create()
      ..createExportFile();
    SampleWidget(
      DirectoryService.paths[dir]!,
      argResults!['name'].toString(),
    )
      ..create()
      ..createExportFile();
    SampleModel(
      DirectoryService.paths[dir]!,
      argResults!['name'].toString(),
    )..create();
    SampleRepository(
      DirectoryService.paths[dir]!,
      argResults!['name'].toString(),
    )..create();
    SampleService(
      DirectoryService.paths[dir]!,
      argResults!['name'].toString(),
    )..create();
    SampleProvider(
      DirectoryService.paths[dir]!,
      argResults!['name'].toString(),
    )
      ..create()
      ..createExportFile();
    DomainExport(
      DirectoryService.paths[dir]!,
      argResults!['name'].toString(),
    )..create();
    FeatureExport(
      DirectoryService.paths[dir]!,
      argResults!['name'].toString(),
    )..create();
  }
}
