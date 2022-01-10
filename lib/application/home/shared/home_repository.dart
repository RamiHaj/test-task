import 'package:dio/dio.dart';
import 'package:test_task/core/constants/keys.dart';
import 'package:test_task/core/exceptions/failure.dart';
import 'package:test_task/core/models/product_model.dart';


class HomeRepository {

  final Dio dio;

  HomeRepository(
      this.dio
      );

  List<ProductElement>? productElement;

  Future<List<ProductElement>?> getProductsRepository() async{
    try {
      Response response = await dio.get(Keys.productsEndPoints,);
      productElement = productFromJson(response.data["products"]);
      return productElement;
    }catch(error)
    {
      withException(exception: error);
    }
  }
}
