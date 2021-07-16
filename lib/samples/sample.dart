import '../utils/files.dart';

abstract class Sample {
  String customContent = '';

  String path;

  String get content;

  String get fullPath;

  Sample(this.path);

  void create() {
    FileService.writeFile(fullPath, content);
  }
}
