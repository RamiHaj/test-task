import 'dart:developer';
import 'package:test_task/core/models/user_model.dart';
import '../../objectbox.g.dart';

class StorageService {
  StorageService._internal();
  Store? store;
  Future openDatabaseStore() async {
    try {
      store = await openStore();
    } on ObjectBoxException catch (e) {
      log("ObjectBoxException from openDatabaseStore: $e");
    }
  }



  bool? clearDB() {
    store!.box<User>().removeAll();
    return true;
  }

  static final StorageService instance = StorageService._internal();
}