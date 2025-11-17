import 'package:equatable/equatable.dart';

abstract class {{name.pascalCase()}}State extends Equatable {
  const {{name.pascalCase()}}State();

  @override
  List<Object?> get props => [];
}

class {{name.pascalCase()}}Initial extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Loading extends {{name.pascalCase()}}State {}

class {{name.pascalCase()}}Loaded extends {{name.pascalCase()}}State {
  final List<int> data;

  const {{name.pascalCase()}}Loaded({required this.data});

  @override
  List<Object?> get props => [data];
}

class {{name.pascalCase()}}Error extends {{name.pascalCase()}}State {
  final String message;

  const {{name.pascalCase()}}Error({required this.message});

  @override
  List<Object?> get props => [message];
}
