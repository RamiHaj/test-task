import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/core/constants/colors.dart';
import 'package:test_task/core/extension/custom_extension.dart';
import 'package:test_task/core/widgets/build_shopping.dart';
import 'package:test_task/application/home/products_controller.dart';

class ShoppingView extends GetView<ProductsController> {
  const ShoppingView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var productStorage = controller.productStorage;
    return controller
        .customObx((state) => productStorage.getAllProduct()!.isEmpty
            ? Center(
                child: Text(
                  'No Products',
                  style: Theme.of(context).textTheme.headline6!.copyWith(
                    color: CustomColors.amber
                  ),
                ),
              )
            : ListView.separated(
                itemBuilder: (context, index) => BuildShopping(
                      shopping: productStorage.getAllProduct()!,
                      index: index,
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      height: 10.h,
                    ),
                itemCount: productStorage.getAllProduct()!.length));
  }
}
