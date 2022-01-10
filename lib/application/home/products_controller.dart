import 'dart:async';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:test_task/core/constants/keys.dart';
import 'package:test_task/core/constants/toast.dart';
import 'package:test_task/core/models/product_model.dart';
import 'package:test_task/core/services/product_storage.dart';
import 'package:test_task/core/services/user_storage.dart';
import 'package:test_task/application/home/shared/home_repository.dart';
import 'package:test_task/application/home/shared/products_view.dart';
import 'package:test_task/application/home/shared/shopping_view.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ProductsController extends GetxController
    with StateMixin<List<ProductElement>?> {

  final UserStorage userStorage;
  final ProductStorage productStorage;
  final HomeRepository homeRepository;

  ProductsController(
      this.productStorage,
      this.userStorage,
      this.homeRepository
      );

  RxInt connectionStatus = 0.obs;

  late StreamSubscription<InternetConnectionStatus> listener;

  @override
  void onInit() async {
    listener = InternetConnectionChecker()
        .onStatusChange
        .listen((InternetConnectionStatus state) {
      switch (state) {
        case InternetConnectionStatus.connected:
          connectionStatus.value = 1;
          showToast(text: 'Done Connection', color: ToastColors.success);
          break;
        case InternetConnectionStatus.disconnected:
          connectionStatus.value = 0;
          showToast(
              text: 'Check your Internet , please!!', color: ToastColors.error);
          break;
      }
    });
    await getProducts();
    super.onInit();
  }

  @override
  void onClose() {
    listener.cancel();
    super.onClose();
  }

  RxInt currentIndex = 0.obs;

  void changeindex(int index) {
    currentIndex.value = index;
  }

  List<Widget> screens = [const ProductsView(), const ShoppingView()];


  List<ProductElement>? productElement;

  Future<void> getProducts() async {
    change(null, status: RxStatus.loading());
    productElement = await homeRepository.getProductsRepository();
    change(productElement, status: RxStatus.success());
  }

  Market? market;

  Future addShopping(ProductElement productItem) async {
    productItem.count = productItem.count + 1;
    productStorage.setProduct(productItem);
    await showNotification(
        title: 'flutter_task',
        body: 'new product has been added successfully',
        payLoad: 'flutter_task.abs');
    update();
  }

  Future deleteShopping(ProductElement productItem) async {
    if (productItem.count == 1) {
      productStorage.removeProduct(productItem.id);
    } else {
      productItem.count = productItem.count - 1;
      productStorage.setProduct(productItem);
    }
    await showNotification(
        title: 'flutter_task',
        body: ' product has been deleted successfully',
        payLoad: 'flutter_task.abs');
    update();
  }

  static final notification = FlutterLocalNotificationsPlugin();

  static Future notificationDetails() async {
    return const NotificationDetails(
      android: AndroidNotificationDetails('channelId', 'channelName',
          channelDescription: 'channelDescription',
          importance: Importance.max,
          icon: '@mipmap/ic_launcher'),
    );
  }

  Future<void> showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payLoad,
  }) async {
    Random random = Random();
    int randomNumber = random.nextInt(100);
    notification.show(randomNumber, title, body, await notificationDetails(),
        payload: payLoad);
  }

  void logOut() {
    userStorage.removeUser();
    productStorage.removeAllProduct();
    Get.offAllNamed(Keys.loginUser);
  }
}
