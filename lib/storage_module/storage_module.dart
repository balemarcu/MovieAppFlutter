import 'package:demo1/storage_module/app_database/app_database.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StorageModule {
  //static StorageModule? _storageModule;

  StorageModule._();

  // static StorageModule getInstance() {
  //   if (_storageModule != null) {
  //     return _storageModule!;
  //   }
  //   _storageModule = StorageModule._();
  //   return _storageModule!;
  // }

  late final SharedPreferences _sharedPreference;

  static Future<StorageModule> createModule() async {
    final module = StorageModule._();
    module._sharedPreference = await SharedPreferences.getInstance();
    //_sharedPreference = await SharedPreferences.getInstance();
    return module;
  }

  SharedPreferences get sharedPreferences => _sharedPreference;
  late final AppDatabase db = AppDatabase();
}

//create database class in storage_
