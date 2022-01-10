import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_task/core/constants/keys.dart';
import 'package:test_task/core/models/user_model.dart';
import 'package:test_task/core/services/product_storage.dart';
import 'package:test_task/core/services/user_storage.dart';
import 'package:test_task/application/auth/shared/auth_repository.dart';

class WrapperController extends GetxController
{
  final Dio dio;
  final UserStorage userStorage;
  final AuthRepository authRepository;
  final ProductStorage productStorage;
  WrapperController({
    required this.dio,
    required this.userStorage,
    required this.authRepository,
    required this.productStorage
});

  @override
  void onReady() {
    User? user = userStorage.getUser();
    isLogin(user);
    super.onReady();
  }

  isLogin(User? user)
  {
    if(user != null)
    {
      Get.offAndToNamed(Keys.productsPage);
    }else{
      Get.offAndToNamed(Keys.loginUser);
    }
  }
}
