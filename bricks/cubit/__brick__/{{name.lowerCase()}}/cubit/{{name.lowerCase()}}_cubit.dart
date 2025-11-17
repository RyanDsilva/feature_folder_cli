import 'package:flutter_bloc/flutter_bloc.dart';

import '{{name.lowerCase()}}_state.dart';
import '../domain/index.dart';

class {{name.pascalCase()}}Cubit extends Cubit<{{name.pascalCase()}}State> {
  {{name.pascalCase()}}Cubit() : super({{name.pascalCase()}}Initial());

  Future<void> fetchData({required String n}) async {
    emit({{name.pascalCase()}}Loading());
    try {
      final data = List.generate(3, (index) => index + 1);
      emit({{name.pascalCase()}}Loaded(data: data));
    } catch (e) {
      emit({{name.pascalCase()}}Error(message: e.toString()));
    }
  }

  void clearData() {
    emit({{name.pascalCase()}}Initial());
  }
}
