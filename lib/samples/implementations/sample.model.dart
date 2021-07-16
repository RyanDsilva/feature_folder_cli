import 'package:recase/recase.dart';

import '../../utils/directory.dart';
import '../sample.dart';

class SampleModel extends Sample {
  final String _featureName;

  SampleModel(
    String path,
    this._featureName,
  ) : super(path);

  String get modelName {
    final widgetName = '$_featureName' 'Model';
    return ReCase(widgetName).pascalCase;
  }

  @override
  String get fullPath {
    return DirectoryService.replaceAsExpected(
        path: '$path/$_featureName/' 'domain/models/$_featureName' '_model.dart');
  }

  String get _content => '''import 'dart:convert';

class $modelName {
  final String? s;
  final int? n;
  final bool? b;

  $modelName({
      required this.s,
      required this.n,
      required this.b,
  });

  factory $modelName.fromRawJson(String str) => 
      $modelName.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory $modelName.fromJson(dynamic json) => $modelName(
      s: json['s'] == null ? null : json['s'].toString(),
      n: json['n'] == null ? null : int.parse(json['n'].toString()),
      b: json['b'] == null ? null : json['b'].toString() == 'true',
  );

  Map<String, dynamic> toJson() => {
      's': s == null ? null : s,
      'n': n == null ? null : n,
      'b': b == null ? null : b,
  };
}
''';

  @override
  String get content => _content;
}
