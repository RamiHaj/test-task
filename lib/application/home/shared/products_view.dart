import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/core/extension/custom_extension.dart';
import 'package:test_task/core/widgets/build_products.dart';
import 'package:test_task/application/auth/shared/elevated_button.dart';
import 'package:test_task/application/home/products_controller.dart';

class ProductsView extends GetView<ProductsController> {
  const ProductsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller
        .customObx((state) => Obx(() => controller.connectionStatus.value == 1
            ? RefreshIndicator(
                onRefresh: () async {
                  await controller.getProducts();
                },
                child: controller.productElement != null
                    ? ListView.separated(
                        itemBuilder: (context, index) => BuildProducts(
                              product: controller.productElement!,
                              index: index,
                            ),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10.h,
                            ),
                        itemCount: controller.productElement!.length)
                    : Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.0.h, vertical: 8.0.w),
                        child: Column(
                          children: [
                            Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.height / 3,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          'assets/images/internetcheck.png'),
                                      fit: BoxFit.cover)),
                            ),
                            CustomElevatedButton(
                                onPressed: () async {
                                  await controller.getProducts();
                                },
                                child: const Text('Retry')),
                          ],
                        ),
                      ))
            : Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 8.0.h, vertical: 8.0.w),
                child: Column(
                  children: [
                    Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height / 3,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/internetcheck.png'),
                              fit: BoxFit.cover)),
                    ),
                    CustomElevatedButton(
                        onPressed: () async {
                          await controller.getProducts();
                        },
                        child: const Text('Retry')),
                  ],
                ),
              )));
  }
}
