import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:test_task/core/constants/keys.dart';
import 'package:test_task/core/routes/routes.dart';
import 'package:test_task/core/services/service_storage.dart';
import 'package:test_task/core/theme/light_theme.dart';
import 'package:test_task/core/transaction/my_transaction.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await StorageService.instance.openDatabaseStore();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize:const Size(360,690),
      builder: ()=> GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Keys.wrapperPage,
        theme: AppTheme.lightTheme,
        getPages: AppRoutes.route,
        defaultTransition: Transition.zoom,
        locale: const Locale('en'),
        translations: MyTranslation(),
      ),
    );
  }
}

