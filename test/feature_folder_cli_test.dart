import 'package:test/test.dart';

void main() {
  group('Smoke Test', () {
    test('1 == 1', () {
      var x = 1;
      expect(x, equals(1));
    });
  });
}
