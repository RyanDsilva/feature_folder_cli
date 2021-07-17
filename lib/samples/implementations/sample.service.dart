import 'package:recase/recase.dart';

import '../../utils/directory.dart';
import '../sample.dart';

/// [SampleService] is the base class from which
/// the service for the feature is created
class SampleService extends Sample {
  final String _featureName;

  SampleService(
    String path,
    this._featureName,
  ) : super(path);

  String get serviceName {
    final serviceName = '$_featureName' 'Service';
    return ReCase(serviceName).pascalCase;
  }

  String get repositoryName {
    final repositoryName = '$_featureName' 'Repository';
    return ReCase(repositoryName).pascalCase;
  }

  @override
  String get fullPath {
    return DirectoryService.replaceAsExpected(
        path: '$path/$_featureName/'
            'domain/services/$_featureName'
            '_service.dart');
  }

  String get _content => '''import '../repository/${_featureName}_repository.dart';

class $serviceName implements $repositoryName {
  @override
  Future<void> get() {
    // TODO: implement get
    throw UnimplementedError();
  }

  @override
  Future<void> post() {
    // TODO: implement post
    throw UnimplementedError();
  }

  @override
  Future<void> put() {
    // TODO: implement put
    throw UnimplementedError();
  }

  @override
  Future<void> delete() {
    // TODO: implement delete
    throw UnimplementedError();
  }
}
''';

  @override
  String get content => _content;

  @override
  String get exportContent => throw UnimplementedError();

  @override
  String get exportFullPath => throw UnimplementedError();
}
