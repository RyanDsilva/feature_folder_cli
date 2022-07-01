import 'package:flutter/material.dart';

class {{name.pascalCase()}}Component extends StatelessWidget {
  const {{name.pascalCase()}}Component({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // TODO: Replace Provider
    return GetBuilder<MyController>(
      builder: (provider) {
        return Container(); 
      },
    );
  }
}