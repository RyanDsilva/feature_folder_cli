import 'dart:io';

class DirectoryService {
  static final Map<String, String> _paths = {
    'feature': replaceAsExpected(path: 'lib'),
    'example': replaceAsExpected(path: 'examples'),
  };

  static Map<String, String> get paths => _paths;

  static String replaceAsExpected({required String path, String? replaceChar}) {
    if (path.contains('\\')) {
      if (Platform.isLinux || Platform.isMacOS) {
        return path.replaceAll('\\', '/');
      } else {
        return path;
      }
    } else if (path.contains('/')) {
      if (Platform.isWindows) {
        return path.replaceAll('/', '\\\\');
      } else {
        return path;
      }
    } else {
      return path;
    }
  }
}
