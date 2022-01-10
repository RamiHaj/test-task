import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/core/constants/colors.dart';
import 'package:test_task/core/models/product_model.dart';


class ProductDetails extends StatelessWidget {
  const ProductDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<ProductElement> productElement = Get.arguments[0];
    int index = Get.arguments[1];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          productElement[index].name,
          style: Theme.of(context).textTheme.bodyText1!.copyWith(
              color: CustomColors.black
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0.h , vertical: 8.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15.r),
              child: CachedNetworkImage(
                imageUrl: productElement[index].imageUrl,
                width: double.infinity,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height/4,
                placeholder: (context , url) => Center(child: CircularProgressIndicator(color: CustomColors.amber,)),
                errorWidget: (context , url , error) => Center(child: CircularProgressIndicator(color: CustomColors.amber,)),
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.only(start: 20.w),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.h),
                child: Divider(
                  height: 2.h,
                  color: CustomColors.amber,
                  indent: 10,
                  endIndent: 10,
                ),
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  child: Text(
                    'Price: ${ productElement[index].price}',
                    style: TextStyle(
                        fontSize: 20.sp,
                        color: CustomColors.amber
                    ),
                  ),
                ),
                const Spacer(),
                Expanded(
                  child: TextButton(
                      onPressed: () {},
                      child: const CircleAvatar(
                        child: Icon(Icons.add_shopping_cart_outlined),
                      )),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'Description: ',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  color: CustomColors.amber
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              productElement[index].description,
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                  fontSize: 15.sp
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Text(
                  'Rating:',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: CustomColors.amber
                  ),
                ),
                SizedBox(
                  width: 5.w,
                ),
                RatingBar.builder(
                    itemSize: 15.0,
                    initialRating:  productElement[index].rate / 2,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemPadding:
                    EdgeInsets.symmetric(horizontal: 2.0.h),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.yellow[500],
                    ),
                    onRatingUpdate: (rating) {})
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Name Market: ',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: CustomColors.amber
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  productElement[index].market.target!.name!,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15.sp
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Address Market: ',
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      color: CustomColors.amber
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Text(
                  productElement[index].market.target!.address!,
                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                      fontSize: 15.sp
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
