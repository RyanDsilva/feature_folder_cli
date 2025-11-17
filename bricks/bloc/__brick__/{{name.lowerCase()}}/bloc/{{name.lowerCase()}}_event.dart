import 'package:equatable/equatable.dart';

abstract class {{name.pascalCase()}}Event extends Equatable {
  const {{name.pascalCase()}}Event();

  @override
  List<Object?> get props => [];
}

class Load{{name.pascalCase()}}Event extends {{name.pascalCase()}}Event {
  final String? parameter;

  const Load{{name.pascalCase()}}Event({this.parameter});

  @override
  List<Object?> get props => [parameter];
}
