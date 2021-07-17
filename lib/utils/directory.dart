import 'dart:io';

/// [DirectoryService] contains utilities related to
/// directory structures and file paths
class DirectoryService {
  static final Map<String, String> _paths = {
    'feature': replaceAsExpected(path: 'lib'),
    'example': replaceAsExpected(path: 'example'),
  };

  /// Contains all the available path mappings
  static Map<String, String> get paths => _paths;

  /// Function that replaces the path string depending on the platform
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
