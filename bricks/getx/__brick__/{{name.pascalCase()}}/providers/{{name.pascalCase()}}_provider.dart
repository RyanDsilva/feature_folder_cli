import 'get:get.dart';

import '../domain/index.dart';

class {{name.pascalCase()}}Provider extends GetxController {
  List<int?> data = [];

  Future<void> fetchData({required String n}) async {
    final _data = List.generate(3, ((index) => index + 1));
    data = _data;
    update();
  }
}