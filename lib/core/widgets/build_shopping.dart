import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/application/home/products_controller.dart';
import 'package:test_task/core/constants/colors.dart';
import 'package:test_task/core/models/product_model.dart';


class BuildShopping extends GetView<ProductsController> {
  const BuildShopping({Key? key, required this.shopping, required this.index}) : super(key: key);
  final List<ProductElement> shopping ;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 8.0.h),
      child: GetBuilder<ProductsController>(
          builder: (_)
          {
            return Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                color: Colors.grey[300],),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: CachedNetworkImage(
                      imageUrl: shopping[index].imageUrl,
                      // fit: BoxFit.cover,
                      height: double.infinity,
                      placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: CustomColors.amber,
                          )),
                      errorWidget: (context, url, error) => Center(
                          child: CircularProgressIndicator(
                            color: CustomColors.amber,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),
                  Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                'Name: ',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: CustomColors.amber
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                shopping[index].name,
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
                            children: [
                              Text(
                                'Price: ',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: CustomColors.amber
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                '${shopping[index].price}',
                                style: Theme.of(context).textTheme.bodyText1,
                              ),
                            ],
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
                                  initialRating: shopping[index].rate / 2,
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
                            children: [
                              Text(
                                'Market: ',
                                style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                    color: CustomColors.amber
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                shopping[index].market.target!.name!,
                                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                                    fontSize: 13.sp
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          if(shopping[index].count != 0 && shopping[index].count != 1)
                            Row(
                              children: [
                                Text(
                                  'count: ',
                                  style: Theme.of(context).textTheme.bodyText1!.copyWith(
                                      color: CustomColors.amber
                                  ),
                                ),
                                SizedBox(
                                  height: 10.h,
                                ),
                                Text(
                                  '${shopping[index].count}',
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ],
                          ),
                          const Spacer(),
                          Row(
                            children: [
                              Expanded(
                                child: TextButton(
                                    onPressed: ()
                                    {
                                      controller.deleteShopping(shopping[index]);
                                    },
                                    child: CircleAvatar(
                                      backgroundColor: CustomColors.amber,
                                      child: Icon(Icons.remove_shopping_cart_outlined , color: CustomColors.black,),
                                    )),
                              ),
                              Expanded(
                                flex: 2,
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'SeeMore',
                                      maxLines: 1,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyText1!
                                          .copyWith(color: CustomColors.amber),
                                    )),
                              )
                            ],
                          )
                        ],
                      ))
                ],
              ),
            );
          },
      ));
  }
}
