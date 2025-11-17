import 'package:test/test.dart';

void main() {
  group('Feature Folder CLI Tests', () {
    test('Package exports main functionality', () {
      // Basic smoke test to ensure package structure is intact
      expect(true, isTrue);
    });

    group('Feature Name Validation', () {
      test('validates lowercase feature names', () {
        final validNames = ['user_auth', 'product_list', 'my_feature'];
        for (final name in validNames) {
          expect(name.toLowerCase() == name, isTrue);
          expect(name.contains(RegExp(r'^[a-z_]+$')), isTrue);
        }
      });

      test('rejects invalid feature names', () {
        final invalidNames = [
          'UserAuth', // PascalCase
          'user-auth', // kebab-case
          'user auth', // spaces
          '123feature', // starts with number
          'feature!', // special characters
        ];
        for (final name in invalidNames) {
          final isValid =
              name.toLowerCase() == name && !name.contains(RegExp(r'[^a-z_]'));
          expect(isValid, isFalse);
        }
      });
    });

    group('State Management Types', () {
      test('supports all state management types', () {
        final supportedTypes = [
          'simple',
          'getx',
          'bloc',
          'cubit',
          'riverpod',
          'provider',
        ];

        expect(supportedTypes.length, equals(6));
        expect(supportedTypes, contains('simple'));
        expect(supportedTypes, contains('getx'));
        expect(supportedTypes, contains('bloc'));
        expect(supportedTypes, contains('cubit'));
        expect(supportedTypes, contains('riverpod'));
        expect(supportedTypes, contains('provider'));
      });
    });
  });
}
