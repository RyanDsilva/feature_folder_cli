// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class SimpleExampleModel {
  String? s;
  int? n;
  SimpleExampleModel({
    this.s,
    this.n,
  });

  SimpleExampleModel copyWith({
    String? s,
    int? n,
  }) {
    return SimpleExampleModel(
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

  factory SimpleExampleModel.fromMap(Map<String, dynamic> map) {
    return SimpleExampleModel(
      s: map['s'] != null ? map['s'] as String : null,
      n: map['n'] != null ? map['n'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SimpleExampleModel.fromJson(String source) => SimpleExampleModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SimpleExampleModel(s: $s, n: $n)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is SimpleExampleModel &&
      other.s == s &&
      other.n == n;
  }

  @override
  int get hashCode => s.hashCode ^ n.hashCode;
}
