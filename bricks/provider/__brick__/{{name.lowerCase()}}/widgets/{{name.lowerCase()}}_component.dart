import 'package:flutter/material.dart';

class {{name.pascalCase()}}Component extends StatelessWidget {
  const {{name.pascalCase()}}Component({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Text('{{name.pascalCase()}} Component'),
    );
  }
}
