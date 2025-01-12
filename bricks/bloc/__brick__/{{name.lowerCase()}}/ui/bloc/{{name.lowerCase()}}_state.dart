part of '{{name.lowerCase()}}_bloc.dart';

class {{name.pascalCase()}}State extends Equatable {
  const {{name.pascalCase()}}State({
    required this.status,
    this.{{name.camelCase()}}s = const [],
  });

  const {{name.pascalCase()}}State.initial() : this(status: {{name.pascalCase()}}Status.initial);

  final {{name.pascalCase()}}Status status;
  final List<{{name.pascalCase()}}Item> {{name.camelCase()}}s;

  @override
  List<Object> get props => [status, {{name.camelCase()}}s];

  {{name.pascalCase()}}State copyWith({
    {{name.pascalCase()}}Status? status,
    List<{{name.pascalCase()}}Item>? {{name.camelCase()}}s,
  }) {
    return {{name.pascalCase()}}State(
      status: status ?? this.status,
      {{name.camelCase()}}s: {{name.camelCase()}}s ?? this.{{name.camelCase()}}s,
    );
  }
}