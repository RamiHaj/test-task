import 'package:dio/dio.dart';
import 'package:test_task/core/constants/keys.dart';
import 'package:test_task/core/constants/toast.dart';
import 'package:test_task/core/exceptions/failure.dart';
import 'package:test_task/core/models/user_model.dart';
import 'package:test_task/core/services/user_storage.dart';

class AuthRepository {
  final Dio dio;
  final UserStorage userStorage;

  AuthRepository({required this.dio, required this.userStorage});
  User? user;

  Future loginUser({
    required String name,
    required String password,
  }) async {
    try {
      Response response = await dio.post(Keys.loginEndPoints, data: {
        'userName': name,
        'password': password,
      });
      user = User.fromJson(response.data);
      showToast(text: 'Login Done', color: ToastColors.success);
      return user;
    } catch (error) {
        withException(exception: error);
    }
  }

  Future registerUser({
    required String userName,
    required String password,
    required String fullName,
    required String phoneNumber,
    required String city,
  }) async {
    try {
      Response response = await dio.post(Keys.registerEndPoints, data: {
        'userName': userName,
        'password': password,
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'city': city,
      });
      user = User.fromJson(response.requestOptions.data);
      showToast(text: 'Register Done', color: ToastColors.success);
      return user;
    } catch (error) {
      withException(exception: error);
    }
  }
}
