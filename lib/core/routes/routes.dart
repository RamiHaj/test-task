import 'package:get/get.dart';
import 'package:test_task/application/auth/login/login_binding.dart';
import 'package:test_task/application/auth/login/login_view.dart';
import 'package:test_task/application/auth/register/register_binding.dart';
import 'package:test_task/application/auth/register/register_view.dart';
import 'package:test_task/application/auth/wrapper/wrapper_binding.dart';
import 'package:test_task/application/auth/wrapper/wrapper_view.dart';
import 'package:test_task/application/home/products.dart';
import 'package:test_task/application/home/products_binding.dart';
import 'package:test_task/core/constants/keys.dart';
import 'package:test_task/core/widgets/product_details.dart';



class AppRoutes
{
  static List<GetPage> get route => [
    GetPage(name: Keys.loginUser, page:()=>const LoginAuth() , binding: LoginBinding()),
    GetPage(name: Keys.registerUser, page:()=>const RegisterAuth() , binding: RegisterBinding()),
    GetPage(name: Keys.productsPage, page:()=>const Products() , binding: ProductsBinding()),
    GetPage(name: Keys.wrapperPage, page:()=>const WrapperView() , binding: WrapperBinding()),
    GetPage(name: Keys.productDetails, page:()=> const ProductDetails()),
  ];
}