import '../utils/files.dart';

/// [Sample] is the Base class that all generated files will build from.
abstract class Sample {
  /// Content of the file
  String customContent = '';

  /// Base path of the file
  String path;

  /// Getter of the file content
  String get content;

  /// Getter of the qualified file path which needs to be overriden
  String get fullPath;

  /// Getter of the export file content
  String get exportContent;

  /// Getter of the qualified fexport ile path which needs to be overriden
  String get exportFullPath;

  Sample(this.path);

  /// Uses FileService to write file to the disk with the given path and content
  ///
  /// [fullPath] needs to be fully qualified path
  /// where the file needs to be created
  ///
  /// [content] is the raw string containing the contents of the file
  void create() {
    FileService.writeFile(fullPath, content);
  }

  /// Uses FileService to write export file
  /// to the disk with the given path and content
  ///
  /// [exportFullPath] needs to be fully qualified path
  /// where the export file needs to be created
  ///
  /// [exportContent] is the raw string containing the
  /// contents of the export file
  void createExportFile() {
    FileService.writeFile(exportFullPath, exportContent);
  }
}
