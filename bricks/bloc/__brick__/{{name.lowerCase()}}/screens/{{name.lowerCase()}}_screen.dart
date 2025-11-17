import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/index.dart';

class {{name.pascalCase()}}Screen extends StatelessWidget {
  const {{name.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => {{name.pascalCase()}}Bloc()..add(const Load{{name.pascalCase()}}Event()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('{{name.pascalCase()}}'),
        ),
        body: BlocBuilder<{{name.pascalCase()}}Bloc, {{name.pascalCase()}}State>(
          builder: (context, state) {
            return switch (state) {
              {{name.pascalCase()}}Initial() => const Center(child: Text('Initial')),
              {{name.pascalCase()}}Loading() => const Center(child: CircularProgressIndicator()),
              {{name.pascalCase()}}Loaded() => Center(
                  child: ListView.builder(
                    itemCount: state.data.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text('Item ${state.data[index]}'),
                    ),
                  ),
                ),
              {{name.pascalCase()}}Error() => Center(child: Text('Error: ${state.message}')),
            };
          },
        ),
      ),
    );
  }
}
