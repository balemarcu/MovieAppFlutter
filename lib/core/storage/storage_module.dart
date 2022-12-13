//import 'package:demo1/storage_module/app_database/app_database.dart';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as p;

import 'app_database/app_database.dart';

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
  AppDatabase get db => AppDatabase(_openConnection());


}

LazyDatabase _openConnection() {
  // // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.

    //sdf
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'movies.sqlite'));
    return NativeDatabase(file);
  });
}
//create database class in storage_
