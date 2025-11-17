import 'package:flutter/foundation.dart';

import '../domain/index.dart';

class {{name.pascalCase()}}Provider with ChangeNotifier {
  List<int> _data = [];
  bool _isLoading = false;
  String? _error;

  List<int> get data => _data;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchData({required String n}) async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    try {
      final fetchedData = List.generate(3, (index) => index + 1);
      _data = fetchedData;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }

  void clearData() {
    _data = [];
    _error = null;
    notifyListeners();
  }
}
