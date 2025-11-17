import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/index.dart';

class {{name.pascalCase()}}Screen extends StatelessWidget {
  const {{name.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => {{name.pascalCase()}}Provider()..fetchData(n: 'initial'),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('{{name.pascalCase()}}'),
        ),
        body: Consumer<{{name.pascalCase()}}Provider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }

            if (provider.error != null) {
              return Center(child: Text('Error: ${provider.error}'));
            }

            return ListView.builder(
              itemCount: provider.data.length,
              itemBuilder: (context, index) => ListTile(
                title: Text('Item ${provider.data[index]}'),
              ),
            );
          },
        ),
        floatingActionButton: Consumer<{{name.pascalCase()}}Provider>(
          builder: (context, provider, child) => FloatingActionButton(
            onPressed: () => provider.fetchData(n: 'refresh'),
            child: const Icon(Icons.refresh),
          ),
        ),
      ),
    );
  }
}
