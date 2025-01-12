import 'package:data_provider/data_provider.dart';
import 'package:equatable/equatable.dart';

abstract class {{name.pascalCase()}}Failure with EquatableMixin implements Exception {
  const {{name.pascalCase()}}Failure(this.error);
  final Object error;
  @override
  List<Object?> get props => [error];
}

class Get{{name.pascalCase()}}ListFailure extends {{name.pascalCase()}}Failure {
  Get{{name.pascalCase()}}ListFailure(super.error);
}

class {{name.pascalCase()}}Repository {
  {{name.pascalCase()}}Repository({
    required {{name.pascalCase()}}Client {{name.camelCase()}}Client,
  }) : _{{name.camelCase()}}Client = {{name.camelCase()}}Client;

  final {{name.pascalCase()}}Client _{{name.camelCase()}}Client;

  Future<List<{{name.pascalCase()}}Item>?> get{{name.pascalCase()}}s() async {
    try {
      return await _{{name.camelCase()}}Client.get{{name.pascalCase()}}s();
    } catch (error, stackTrace) {
      Error.throwWithStackTrace(Get{{name.pascalCase()}}ListFailure(error), stackTrace);
    }
  }
}