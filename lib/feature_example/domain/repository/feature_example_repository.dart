abstract class FeatureExampleRepository {
  const FeatureExampleRepository();

  Future<void> get();
  Future<void> post();
  Future<void> put();
  Future<void> delete();
}
