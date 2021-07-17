import 'package:ansicolor/ansicolor.dart';

/// [LogService] is a utility to print messages to the console
/// with configuration for different colors
class LogService {
  static final AnsiPen _penError = AnsiPen()..red(bold: true);
  static final AnsiPen _penSuccess = AnsiPen()..green(bold: true);
  static final AnsiPen _penInfo = AnsiPen()..yellow(bold: true);

  /// Prints error to the console with a ✖ followed by the message in red
  static void error(String msg) {
    const sep = '\n';
    msg = '${_penError('✖ ${msg.trim()}')}';
    msg = msg + sep;
    // ignore: avoid_print
    print(msg);
  }

  /// Prints success to the console with a ✓ followed by the message in green
  static void success(dynamic msg) {
    // ignore: avoid_print
    print('${_penSuccess('✓ $msg')}');
  }

  /// Prints info to the console in yellow
  static void info(
    String msg, {
    bool trim = false,
    bool newLines = true,
  }) {
    final sep = newLines ? '\n' : '';
    if (trim) msg = msg.trim();
    msg = _penInfo(msg);
    msg = sep + msg.toString() + sep;
    // ignore: avoid_print
    print(msg);
  }
}
