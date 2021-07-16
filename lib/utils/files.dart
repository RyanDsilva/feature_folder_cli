import 'dart:io';

import 'directory.dart';
import 'logs.dart';

class FileService {
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
