import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class {{name.pascalCase()}}Component extends ConsumerWidget {
  const {{name.pascalCase()}}Component({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: const Text('{{name.pascalCase()}} Component'),
    );
  }
}
