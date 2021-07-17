import 'package:recase/recase.dart';

import '../../utils/directory.dart';
import '../sample.dart';

/// [SampleWidget] is the base class from which
/// the widget for the feature is created
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

  @override
  String get exportFullPath {
    return DirectoryService.replaceAsExpected(
        path: '$path/$_featureName/' 'widgets/widgets.dart');
  }

  @override
  String get exportContent => '''export '${_featureName}_widget.dart';
''';
}
