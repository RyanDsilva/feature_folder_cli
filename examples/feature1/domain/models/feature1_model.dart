import 'dart:convert';

class Feature1Model {
  final String? s;
  final int? n;
  final bool? b;

  Feature1Model({
    required this.s,
    required this.n,
    required this.b,
  });

  factory Feature1Model.fromRawJson(String str) =>
      Feature1Model.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Feature1Model.fromJson(dynamic json) => Feature1Model(
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
