import 'package:test_task/core/models/user_model.dart';
import 'package:test_task/core/services/service_storage.dart';
import '../../objectbox.g.dart';

class UserStorage {
  Box<User>? _user;
  UserStorage() {
    StorageService storageService = StorageService.instance;
    _user = storageService.store!.box<User>();
  }

  User? getUser() {
    try {
      if (_user!.isEmpty()) {
        return null;
      } else {
        List<User> users = _user!.getAll();
        return users[0];
      }
    } on ObjectBoxException catch (_) {
      // CustomToast.showError(CustomError.unKnown);
      return null;
    }
  }

  void setUser(User user) {
    try {
      _user!.put(user);
    } on ObjectBoxException catch (_) {
      // CustomToast.showError(CustomError.unKnown);
    }
  }

  void removeUser() {
    try {
      _user!.removeAll();
    } on ObjectBoxException catch (_) {
      // CustomToast.showError(CustomError.unKnown);
    }
  }
}