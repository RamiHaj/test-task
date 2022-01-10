import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/application/auth/shared/elevated_button.dart';
import 'package:test_task/core/constants/colors.dart';
import 'package:test_task/core/constants/keys.dart';
import 'package:test_task/application/auth/login/login_controller.dart';
import 'package:test_task/application/auth/shared/text_form_field.dart';

class LoginAuth extends GetView<LoginController> {
  const LoginAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Login',
          style: Theme.of(context).textTheme.headline6,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.h, vertical: 10.0.w),
        child: SingleChildScrollView(
          child: Center(
            child: Form(
              key: controller.formKey1.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('login now to browse our hot offers',
                      style: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(color: Colors.grey)),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomTextForm(
                    textEditingController: controller.userNameController,
                    validator: (String? value) =>
                        controller.validate(value, 'user name'),
                    textInputType: TextInputType.text,
                    textInputAction: TextInputAction.next,
                    prefix: Icon(
                      Icons.person,
                      color: CustomColors.amber,
                    ),
                    hintText: 'User Name',
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Obx(() => CustomTextForm(
                        textEditingController: controller.passwordController,
                        validator: (String? value) =>
                            controller.validate(value, 'password'),
                        textInputType: TextInputType.text,
                        textInputAction: TextInputAction.next,
                        obscureText: controller.isVisible.value,
                        prefix: Icon(
                          Icons.lock,
                          color: CustomColors.amber,
                        ),
                        suffix: IconButton(
                            onPressed: () {
                              controller.changeIcon();
                            },
                            icon: Icon(
                              controller.suffix.value,
                              color: CustomColors.amber,
                            )),
                        hintText: 'Password',
                      )),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomElevatedButton(
                    child: const Center(
                      child: Text('SIGN UP'),
                    ),
                    onPressed: () {
                      if (controller.formKey1.value.currentState!.validate()) {
                        controller.loginUser(
                            name: controller.userNameController.text,
                            password: controller.passwordController.text);
                      }
                    },
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                          onPressed: () {
                            Get.toNamed(Keys.registerUser);
                          },
                          child: Text(
                            'REGISTER',
                            style: TextStyle(color: CustomColors.amber),
                          ))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
