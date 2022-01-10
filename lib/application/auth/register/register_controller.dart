import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_task/core/constants/keys.dart';
import 'package:test_task/core/exceptions/failure.dart';
import 'package:test_task/core/models/user_model.dart';
import 'package:test_task/core/services/user_storage.dart';
import 'package:test_task/application/auth/shared/auth_repository.dart';

class RegisterController extends GetxController {

  final AuthRepository authRepository;
  final UserStorage userStorage;

  RegisterController(
      this.authRepository,
      this.userStorage
      );

  TextEditingController fullNameController = TextEditingController();

  TextEditingController nameController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController cityController = TextEditingController();

  Rx<GlobalKey<FormState>>  formKey = GlobalKey<FormState>().obs;

  final RxBool isVisible = true.obs;

  final Rx<IconData> suffix = Icons.visibility_off.obs;

  void changeIcon() {
    isVisible.value = !isVisible.value;
    suffix.value = isVisible.value ? Icons.visibility_off : Icons.visibility;
  }

  String? validate(String? text, String who) {
    if (text!.isEmpty) {
      return '$who must not empty';
    }
    return null;
  }

  User? user;

  void registerUser({
    required String userName,
    required String password,
    required String fullName,
    required String phoneNumber,
    required String city,
  }) async {
    try {
      var response = await authRepository.registerUser(
          userName: userName,
          password: password,
          fullName: fullName,
          phoneNumber: phoneNumber,
          city: city);
      if(response != null)
      {
        setUser();
      }
    } catch (error) {
      withException(exception: error);
    }
  }

  void setUser() {
    user = User(isLog: true);
    userStorage.setUser(user!);
    Get.offAllNamed(Keys.productsPage);
  }
}
