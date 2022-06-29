// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GetxExampleModel {
  String? s;
  int? n;
  GetxExampleModel({
    this.s,
    this.n,
  });

  GetxExampleModel copyWith({
    String? s,
    int? n,
  }) {
    return GetxExampleModel(
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

  factory GetxExampleModel.fromMap(Map<String, dynamic> map) {
    return GetxExampleModel(
      s: map['s'] != null ? map['s'] as String : null,
      n: map['n'] != null ? map['n'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetxExampleModel.fromJson(String source) => GetxExampleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'GetxExampleModel(s: $s, n: $n)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GetxExampleModel &&
      other.s == s &&
      other.n == n;
  }

  @override
  int get hashCode => s.hashCode ^ n.hashCode;
}
