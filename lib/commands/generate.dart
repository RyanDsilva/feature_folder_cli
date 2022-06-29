import 'dart:io';

import 'package:args/command_runner.dart';
import 'package:mason/mason.dart';

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
  /// [type] is a optional argument that represents the type of the feature
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
      mandatory: false,
      help: 'Type of feature:\n[getx] GetX',
    );
  }

  @override
  String get description => _description;

  @override
  String get name => _name;

  @override
  void run() {
    switch (argResults!['type'].toString()) {
      case 'getx':
        _generateGetXItems();
        break;
      default:
        _generateItems();
    }
    LogService.success('Feature ${argResults!['name']} created successfully');
  }

  Future<void> _generateGetXItems({bool dryRun = true}) async {
    var dir = 'feature';
    if (dryRun) {
      dir = 'example';
    }
    try {
      final brick =
          Brick.path(DirectoryService.replaceAsExpected(path: 'lib/bricks/getx'));
      final generator = await MasonGenerator.fromBrick(brick);
      final target = DirectoryGeneratorTarget(
        Directory(DirectoryService.paths[dir]!),
      );
      await generator.generate(
        target,
        vars: <String, dynamic>{'name': argResults!['name'].toString()},
      );
    } on Exception catch (e) {
      LogService.error(e.toString());
    }
  }

  void _generateItems({bool dryRun = true}) {
    var dir = 'feature';
    if (dryRun) {
      dir = 'example';
    }
    try {
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
    } on Exception catch (e) {
      LogService.error(e.toString());
    }
  }
}
