import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:masak_app/services/services.dart';
import 'package:masak_app/ui/pages/pages.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:masak_app/ui/shared/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return ScreenUtilInit(
      designSize: Size(720, 1280),
      allowFontScaling: true,
      child: GetMaterialApp(
        title: 'Masak App',
        initialBinding: InitBinding(),
        initialRoute: "/",
        theme: lightTheme,
        getPages: [
          GetPage(
              name: "/", page: () => SplashView(), binding: SplashBinding()),
          GetPage(
              name: "/home", page: () => HomeView(), binding: HomeBinding()),
          GetPage(
              name: "/detailrecipe",
              page: () => DetailRecipeView(),
              binding: DetailRecipeBinding()),
          GetPage(
              name: "/recipesbycategory",
              page: () => RecipesByCategoryView(),
              binding: RecipesByCategoryBinding()),
        ],
      ),
    );
  }
}

class InitBinding extends Bindings {
  @override
  void dependencies() {
    // Inject Class for Global
    Get.put(ApiService());
  }
}
