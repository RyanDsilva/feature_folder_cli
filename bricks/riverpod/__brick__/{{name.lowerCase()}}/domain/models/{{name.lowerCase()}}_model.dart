// ignore_for_file: public_member_api_docs
import 'dart:convert';

import 'package:freezed_annotation/freezed_annotation.dart';

part '{{name.lowerCase()}}_model.freezed.dart';
part '{{name.lowerCase()}}_model.g.dart';

@freezed
class {{name.pascalCase()}}Model with _${{name.pascalCase()}}Model {
  const factory {{name.pascalCase()}}Model({
    String? s,
    int? n,
  }) = _{{name.pascalCase()}}Model;

  factory {{name.pascalCase()}}Model.fromJson(Map<String, dynamic> json) =>
      _${{name.pascalCase()}}ModelFromJson(json);
}
