import 'dart:io';

import 'directory.dart';
import 'logs.dart';

/// [FileService] contains utilties related to File IO
class FileService {
  /// Function that writes file to the disk
  ///
  /// [path] has to be a fully qualified path
  /// [content] is the raw file contents as string
  static void writeFile(
    String path,
    String content,
  ) {
    try {
      final _file = File(DirectoryService.replaceAsExpected(path: path));
      _file.createSync(recursive: true);
      _file.writeAsStringSync(content);
      LogService.success('Created $path');
    } on FileSystemException catch (err) {
      LogService.error('${err.message} -> ${'$path'}');
    }
  }
}
