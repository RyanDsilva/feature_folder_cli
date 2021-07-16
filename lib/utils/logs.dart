import 'package:ansicolor/ansicolor.dart';

class LogService {
  static final AnsiPen _penError = AnsiPen()..red(bold: true);
  static final AnsiPen _penSuccess = AnsiPen()..green(bold: true);
  static final AnsiPen _penInfo = AnsiPen()..yellow(bold: true);

  static void error(String msg) {
    const sep = '\n';
    msg = '${_penError('✖ ${msg.trim()}')}';
    msg = msg + sep;
    // ignore: avoid_print
    print(msg);
  }

  static void success(dynamic msg) {
    // ignore: avoid_print
    print('${_penSuccess('✓ $msg')}');
  }

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
