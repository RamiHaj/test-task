import 'package:get/get.dart';
import 'package:test_task/application/auth/login/login_controller.dart';
import 'package:test_task/application/auth/shared/auth_repository.dart';
import 'package:test_task/core/services/user_storage.dart';

class LoginBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController(
      Get.find<AuthRepository>(),
      Get.find<UserStorage>()
    ));
  }

}