import 'dart:async';
import 'package:dap_foreman_assis/{{name.lowerCase()}}/{{name.lowerCase()}}.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part '{{name.lowerCase()}}_event.dart';
part '{{name.lowerCase()}}_state.dart';

class {{name.pascalCase()}}Bloc extends Bloc<{{name.pascalCase()}}Event, {{name.pascalCase()}}State> {
  {{name.pascalCase()}}Bloc({required {{name.pascalCase()}}Repository {{name.camelCase()}}Repository})
      : _{{name.camelCase()}}Repository = {{name.camelCase()}}Repository,
        super(const {{name.pascalCase()}}State.initial()) {
    on<{{name.pascalCase()}}Requested>(_onRequested);
    on<{{name.pascalCase()}}RefreshRequested>(_onRefresh);
  }

  final {{name.pascalCase()}}Repository _{{name.camelCase()}}Repository;

  FutureOr<void> _onRequested(
    {{name.pascalCase()}}Requested event,
    Emitter<{{name.pascalCase()}}State> emit,
  ) async {
    try {
      if (state.status == {{name.pascalCase()}}Status.loading ||
          (state.status != {{name.pascalCase()}}Status.refreshing &&
              state.{{name.camelCase()}}s.isNotEmpty)) {
        return;
      }
      emit(state.copyWith(status: {{name.pascalCase()}}Status.loading));
      final {{name.camelCase()}}s = await _{{name.camelCase()}}Repository.get{{name.pascalCase()}}s();
      emit(
        state.copyWith(
          status: {{name.pascalCase()}}Status.success,
          {{name.camelCase()}}s: {{name.camelCase()}}s,
        ),
      );
    } catch (error, stackTrace) {
      emit(state.copyWith(status: {{name.pascalCase()}}Status.failure));
      addError(error, stackTrace);
    }
  }

  void _onRefresh(
    {{name.pascalCase()}}RefreshRequested event,
    Emitter<{{name.pascalCase()}}State> emit,
  ) {
    emit(state.copyWith(status: {{name.pascalCase()}}Status.refreshing));
    add(const {{name.pascalCase()}}Requested());
  }
}