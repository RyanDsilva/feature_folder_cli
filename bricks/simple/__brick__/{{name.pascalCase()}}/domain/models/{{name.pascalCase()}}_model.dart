// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class {{name.pascalCase()}}Model {
  String? s;
  int? n;
  {{name.pascalCase()}}Model({
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
      s: map['s'] != null ? map['s'] as String : null,
      n: map['n'] != null ? map['n'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory {{name.pascalCase()}}Model.fromJson(String source) => {{name.pascalCase()}}Model.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => '{{name.pascalCase()}}Model(s: $s, n: $n)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is {{name.pascalCase()}}Model &&
      other.s == s &&
      other.n == n;
  }

  @override
  int get hashCode => s.hashCode ^ n.hashCode;
}
