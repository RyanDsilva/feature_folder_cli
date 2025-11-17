import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../domain/index.dart';

part '{{name.lowerCase()}}_provider.g.dart';

@riverpod
class {{name.pascalCase()}}Notifier extends _${{name.pascalCase()}}Notifier {
  @override
  AsyncValue<List<int>> build() {
    return const AsyncValue.data([]);
  }

  Future<void> fetchData({required String n}) async {
    state = const AsyncValue.loading();
    try {
      final data = List.generate(3, (index) => index + 1);
      state = AsyncValue.data(data);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

@riverpod
Future<List<{{name.pascalCase()}}Model>> fetch{{name.pascalCase()}}List(Fetch{{name.pascalCase()}}ListRef ref) async {
  // TODO: Implement data fetching
  return [];
}
