import '../../utils/directory.dart';
import '../sample.dart';

/// [DomainExport] is the base class from which
/// the domain exports for the feature is created
class DomainExport extends Sample {
  final String _featureName;

  DomainExport(
    String path,
    this._featureName,
  ) : super(path);

  String get modelPath {
    return DirectoryService.replaceAsExpected(
        path: 'models/$_featureName' '_model.dart');
  }

  String get repositoryPath {
    return DirectoryService.replaceAsExpected(
        path: 'repository/$_featureName' '_repository.dart');
  }

  String get servicePath {
    return DirectoryService.replaceAsExpected(
        path: 'services/$_featureName' '_service.dart');
  }

  @override
  String get fullPath {
    return DirectoryService.replaceAsExpected(
        path: '$path/$_featureName/' 'domain/$_featureName' '_domain.dart');
  }

  String get _content => '''export '$modelPath';
export '$repositoryPath';
export '$servicePath';
''';

  @override
  String get content => _content;

  @override
  String get exportContent => throw UnimplementedError();

  @override
  String get exportFullPath => throw UnimplementedError();
}
