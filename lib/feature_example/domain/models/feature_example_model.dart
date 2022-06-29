import 'dart:convert';

class FeatureExampleModel {
  final String? s;
  final int? n;
  final bool? b;

  FeatureExampleModel({
      required this.s,
      required this.n,
      required this.b,
  });

  factory FeatureExampleModel.fromRawJson(String str) => 
      FeatureExampleModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory FeatureExampleModel.fromJson(dynamic json) => FeatureExampleModel(
      s: json['s'] == null ? null : json['s'] as String,
      n: json['n'] == null ? null : json['n'] as int,
      b: json['b'] == null ? null : json['b'] as bool,
  );

  Map<String, dynamic> toJson() => {
      's': s == null ? null : s,
      'n': n == null ? null : n,
      'b': b == null ? null : b,
  };
}
