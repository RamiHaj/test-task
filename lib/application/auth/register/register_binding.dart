import 'package:get/get.dart';
import 'package:test_task/application/auth/register/register_controller.dart';
import 'package:test_task/application/auth/shared/auth_repository.dart';
import 'package:test_task/core/services/user_storage.dart';

class RegisterBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => RegisterController(
      Get.find<AuthRepository>(),
      Get.find<UserStorage>()
    ));
  }

}