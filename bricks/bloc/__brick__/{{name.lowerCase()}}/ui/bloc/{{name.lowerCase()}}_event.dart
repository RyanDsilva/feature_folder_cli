part of '{{name.lowerCase()}}_bloc.dart';

enum {{name.pascalCase()}}Status { initial, loading, success, failure, refreshing }

sealed class {{name.pascalCase()}}Event extends Equatable {
  const {{name.pascalCase()}}Event();
  @override
  List<Object> get props => [];
}

final class {{name.pascalCase()}}Requested extends {{name.pascalCase()}}Event {
  const {{name.pascalCase()}}Requested();
}

final class {{name.pascalCase()}}RefreshRequested extends {{name.pascalCase()}}Event {
  const {{name.pascalCase()}}RefreshRequested();
}