import 'package:flutter_bloc/flutter_bloc.dart';

import '{{name.lowerCase()}}_event.dart';
import '{{name.lowerCase()}}_state.dart';
import '../domain/index.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc() : super({{name.pascalCase()}}Initial()) {
    on<Load{{name.pascalCase()}}Event>(_onLoad{{name.pascalCase()}});
  }

  Future<void> _onLoad{{name.pascalCase()}}(
    Load{{name.pascalCase()}}Event event,
    Emitter<{{name.pascalCase()}}State> emit,
  ) async {
    emit({{name.pascalCase()}}Loading());
    try {
      final data = List.generate(3, (index) => index + 1);
      emit({{name.pascalCase()}}Loaded(data: data));
    } catch (e) {
      emit({{name.pascalCase()}}Error(message: e.toString()));
    }
  }
}
