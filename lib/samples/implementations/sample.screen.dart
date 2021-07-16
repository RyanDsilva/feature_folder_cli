import 'package:recase/recase.dart';

import '../../utils/directory.dart';
import '../sample.dart';

class SampleScreen extends Sample {
  final String _featureName;

  SampleScreen(
    String path,
    this._featureName,
  ) : super(path);

  String get import => '''import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
''';

  String get screenName {
    final screenName = '$_featureName' 'Screen';
    return ReCase(screenName).pascalCase;
  }

  @override
  String get fullPath {
    return DirectoryService.replaceAsExpected(
        path: '$path/$_featureName/' 'screens/$_featureName' '_screen.dart');
  }

  String get _content => '''$import
class $screenName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          '$screenName is working', 
        ),
      ),
    );
  }
}
''';

  @override
  String get content => _content;
}
