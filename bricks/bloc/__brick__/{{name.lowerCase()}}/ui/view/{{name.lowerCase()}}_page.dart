import 'package:app_ui/app_ui.dart';
import 'package:dap_foreman_assis/{{name.lowerCase()}}/{{name.lowerCase()}}.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part '{{name.lowerCase()}}_view.dart';

class {{name.pascalCase()}}Page extends StatelessWidget {
  const {{name.pascalCase()}}Page({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => {{name.pascalCase()}}Bloc(
        {{name.camelCase()}}Repository: {{name.pascalCase()}}Repository(
          {{name.camelCase()}}Client: {{name.pascalCase()}}Client(),
        ),
      ),
      child: const Scaffold(
        body: {{name.pascalCase()}}View(),
      ),
    );
  }
}