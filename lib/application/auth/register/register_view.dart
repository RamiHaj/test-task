import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/application/auth/shared/elevated_button.dart';
import 'package:test_task/application/auth/shared/text_form_field.dart';
import 'package:test_task/application/auth/register/register_controller.dart';
import 'package:test_task/core/constants/colors.dart';

class RegisterAuth extends GetView<RegisterController> {
  const RegisterAuth({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Form(
        key: controller.formKey.value,
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 8.0.h),
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Register',
                  style:
                      TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w900)),
              SizedBox(
                height: 10.h,
              ),
              Text('register now to browse our hot offers',
                  style: Theme.of(context)
                      .textTheme
                      .bodyText1!
                      .copyWith(color: Colors.grey)),
              SizedBox(
                height: 30.h,
              ),
              CustomTextForm(
                textEditingController: controller.nameController,
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
              CustomTextForm(
                textEditingController: controller.fullNameController,
                validator: (String? value) =>
                    controller.validate(value, 'Full Name'),
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                prefix: Icon(
                  Icons.person,
                  color: CustomColors.amber,
                ),
                hintText: 'Full Name',
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomTextForm(
                textEditingController: controller.phoneController,
                validator: (String? value) =>
                    controller.validate(value, 'Phone'),
                textInputType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                prefix: Icon(
                  Icons.phone,
                  color: CustomColors.amber,
                ),
                hintText: 'Phone',
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
                    hintText: 'Password',
                    suffix: IconButton(
                      onPressed: () {
                        controller.changeIcon();
                      },
                      icon: Icon(
                        controller.suffix.value,
                        color: CustomColors.amber,
                      ),
                    ),
                  )),
              SizedBox(
                height: 10.h,
              ),
              CustomTextForm(
                textEditingController: controller.cityController,
                validator: (String? value) =>
                    controller.validate(value, 'City'),
                textInputType: TextInputType.text,
                textInputAction: TextInputAction.next,
                prefix: Icon(
                  Icons.location_on_outlined,
                  color: CustomColors.amber,
                ),
                hintText: 'City',
              ),
              SizedBox(
                height: 10.h,
              ),
              CustomElevatedButton(
                child: const Center(
                  child: Text('SIGN UP'),
                ),
                onPressed: () {
                  if (controller.formKey.value.currentState!.validate()) {
                    controller.registerUser(
                        userName: controller.nameController.text,
                        password: controller.passwordController.text,
                        fullName: controller.fullNameController.text,
                        phoneNumber: controller.phoneController.text,
                        city: controller.cityController.text);
                  }
                },
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
