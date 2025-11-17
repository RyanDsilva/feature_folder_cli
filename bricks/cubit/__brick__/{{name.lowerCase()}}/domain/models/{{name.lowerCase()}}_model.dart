// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:equatable/equatable.dart';

class {{name.pascalCase()}}Model extends Equatable {
  final String? s;
  final int? n;

  const {{name.pascalCase()}}Model({
    this.s,
    this.n,
  });

  {{name.pascalCase()}}Model copyWith({
    String? s,
    int? n,
  }) {
    return {{name.pascalCase()}}Model(
      s: s ?? this.s,
      n: n ?? this.n,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      's': s,
      'n': n,
    };
  }

  factory {{name.pascalCase()}}Model.fromMap(Map<String, dynamic> map) {
    return {{name.pascalCase()}}Model(
      s: map['s'] as String?,
      n: map['n'] as int?,
    );
  }

  String toJson() => json.encode(toMap());

  factory {{name.pascalCase()}}Model.fromJson(String source) =>
      {{name.pascalCase()}}Model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => '{{name.pascalCase()}}Model(s: $s, n: $n)';

  @override
  List<Object?> get props => [s, n];
}
