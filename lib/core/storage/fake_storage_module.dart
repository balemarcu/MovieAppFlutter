//import 'package:demo1/storage_module/app_database/app_database.dart';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as p;

import 'app_database/app_database.dart';

// @module
class FakeStorageModule {
  //StorageModule._();

  // @preResolve
  Future<SharedPreferences> get prefs {
    SharedPreferences.setMockInitialValues({});
    return SharedPreferences.getInstance();
  }

  // @lazySingleton
  AppDatabase get db => AppDatabase(NativeDatabase.memory());
}

//create database class in storage_
