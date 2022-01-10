import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_task/core/dio/diofactory.dart';
import 'package:test_task/core/services/product_storage.dart';
import 'package:test_task/core/services/user_storage.dart';
import 'package:test_task/application/auth/shared/auth_repository.dart';
import 'package:test_task/application/auth/wrapper/wrapper_controller.dart';

class WrapperBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<WrapperController>(
      WrapperController(
          dio: Get.put<Dio>(DioFactory.dioSetUp(), permanent: true),
          userStorage: Get.put<UserStorage>(UserStorage(), permanent: true),
          authRepository: Get.put<AuthRepository>(
              AuthRepository(
                userStorage: Get.put<UserStorage>(UserStorage()),
                dio: Get.put<Dio>(DioFactory.dioSetUp()),
              ),
              permanent: true),
          productStorage:
              Get.put<ProductStorage>(ProductStorage(), permanent: true)),
    );
  }
}
