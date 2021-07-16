import 'package:recase/recase.dart';

import '../../utils/directory.dart';
import '../sample.dart';

class SampleWidget extends Sample {
  final String _featureName;

  SampleWidget(
    String path,
    this._featureName,
  ) : super(path);

  String get import => '''import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
''';

  String get widgetName {
    final widgetName = '$_featureName' 'Widget';
    return ReCase(widgetName).pascalCase;
  }

  @override
  String get fullPath {
    return DirectoryService.replaceAsExpected(
        path: '$path/$_featureName/' 'widgets/$_featureName' '_widget.dart');
  }

  String get _content => '''$import
class $widgetName extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          '$widgetName is working', 
        ),
      ),
    );
  }
}
''';

  @override
  String get content => _content;
}
