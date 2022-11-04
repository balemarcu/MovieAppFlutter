import 'package:shared_preferences/shared_preferences.dart';

class StorageModule {
  static StorageModule? _storageModule;

  StorageModule._();
  static StorageModule getInstance() {
    if (_storageModule != null) {
      return _storageModule!;
    }
    _storageModule = StorageModule._();
    return _storageModule!;
  }

  late final SharedPreferences _sharedPreference;
  Future<void> initModule() async {
    _sharedPreference = await SharedPreferences.getInstance();
  }

  SharedPreferences get sharedPreferences => _sharedPreference;
}

//create database class in storage_
