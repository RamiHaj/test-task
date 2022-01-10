import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/core/constants/colors.dart';
import 'package:test_task/application/home/products_controller.dart';

class Products extends GetView<ProductsController> {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
              onPressed: ()
              {
                controller.logOut();
              },
              icon:const Icon(Icons.logout)
          )
        ],
      ),
      body: controller.screens[controller.currentIndex.value],
      bottomNavigationBar: AnimatedBottomNavigationBar(
        onTap: (index ) {
          controller.changeindex(index);
        },
        activeIndex: controller.currentIndex.value,
        icons:const [
          Icons.home,
          Icons.shopping_cart
        ],
        activeColor: CustomColors.amber,
        gapLocation: GapLocation.center,
        leftCornerRadius: 32.r,
        rightCornerRadius: 32.r,
      ),
    ));
  }
}
