import 'package:recase/recase.dart';

import '../../utils/directory.dart';
import '../sample.dart';

/// [SampleProvider] is the base class from which
/// the repository for the feature is created
///
/// Can be integrated with the state management solution of your choice
class SampleProvider extends Sample {
  final String _featureName;

  SampleProvider(
    String path,
    this._featureName,
  ) : super(path);

  String get providerName {
    final providerName = '$_featureName' 'Provider';
    return ReCase(providerName).pascalCase;
  }

  @override
  String get fullPath {
    return DirectoryService.replaceAsExpected(
        path: '$path/$_featureName/'
            'providers/$_featureName'
            '_provider.dart');
  }

  String get _content => '''class $providerName {}
''';

  @override
  String get content => _content;

  @override
  String get exportContent => '''export '${_featureName}_provider.dart';
''';

  @override
  String get exportFullPath {
    return DirectoryService.replaceAsExpected(
        path: '$path/$_featureName/' 'providers/providers.dart');
  }
}
