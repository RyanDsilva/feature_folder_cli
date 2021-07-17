import 'package:recase/recase.dart';

import '../../utils/directory.dart';
import '../sample.dart';

/// [SampleRepository] is the base class from which
/// the repository for the feature is created
class SampleRepository extends Sample {
  final String _featureName;

  SampleRepository(
    String path,
    this._featureName,
  ) : super(path);

  String get repositoryName {
    final repositoryName = '$_featureName' 'Repository';
    return ReCase(repositoryName).pascalCase;
  }

  @override
  String get fullPath {
    return DirectoryService.replaceAsExpected(
        path: '$path/$_featureName/'
            'domain/repository/$_featureName'
            '_repository.dart');
  }

  String get _content => '''abstract class $repositoryName {
  const $repositoryName();

  Future<void> get();
  Future<void> post();
  Future<void> put();
  Future<void> delete();
}
''';

  @override
  String get content => _content;

  @override
  String get exportContent => throw UnimplementedError();

  @override
  String get exportFullPath => throw UnimplementedError();
}
