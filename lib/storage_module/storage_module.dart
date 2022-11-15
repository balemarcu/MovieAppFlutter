import 'package:demo1/storage_module/app_database/app_database.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class StorageModule {
  //StorageModule._();
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  // static Future<StorageModule> createModule() async {
  //   final module = StorageModule._();
  //   module._sharedPreference = await SharedPreferences.getInstance();

  //   return module;
  // }

  //SharedPreferences get sharedPreferences => _sharedPreference;
  @lazySingleton
  AppDatabase get db => AppDatabase();
}

//create database class in storage_
