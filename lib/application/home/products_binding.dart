import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:test_task/application/home/products_controller.dart';
import 'package:test_task/application/home/shared/home_repository.dart';
import 'package:test_task/core/services/product_storage.dart';
import 'package:test_task/core/services/user_storage.dart';

class ProductsBinding extends Bindings
{
  @override
  void dependencies() {
    Get.lazyPut(() => ProductsController(
      Get.find<ProductStorage>(),
      Get.find<UserStorage>(),
      Get.put(HomeRepository(
        Get.find<Dio>()
      ))
    ));
  }

}