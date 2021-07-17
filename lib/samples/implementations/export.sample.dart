import '../../utils/directory.dart';
import '../sample.dart';

/// [FeatureExport] is the base class from which
/// the domain exports for the feature is created
class FeatureExport extends Sample {
  final String _featureName;

  FeatureExport(
    String path,
    this._featureName,
  ) : super(path);

  String get domainPath {
    return DirectoryService.replaceAsExpected(
        path: 'domain/$_featureName' '_domain.dart');
  }

  String get screensPath {
    return DirectoryService.replaceAsExpected(path: 'screens/screens.dart');
  }

  String get widgetsPath {
    return DirectoryService.replaceAsExpected(path: 'widgets/widgets.dart');
  }

  String get providersPath {
    return DirectoryService.replaceAsExpected(path: 'providers/providers.dart');
  }

  @override
  String get fullPath {
    return DirectoryService.replaceAsExpected(
        path: '$path/$_featureName/' 'index.dart');
  }

  String get _content => '''export '$domainPath';
export '$providersPath';
export '$screensPath';
export '$widgetsPath';
''';

  @override
  String get content => _content;

  @override
  String get exportContent => throw UnimplementedError();

  @override
  String get exportFullPath => throw UnimplementedError();
}
