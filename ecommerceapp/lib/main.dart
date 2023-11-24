// import 'package:ecommerceapp/controller/theme_controller.dart';

import 'package:ecommerceapp/constants/color_const.dart';
import 'package:ecommerceapp/controller/auth_controller.dart';
import 'package:ecommerceapp/controller/productcontroller.dart';
import 'package:ecommerceapp/controller/user_controller.dart';

import 'package:ecommerceapp/ui/screen/login_screen.dart';
import 'package:ecommerceapp/ui/screen/main_page_screen.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'helper/dpendencies.dart' as dep;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<PopularProductController>().getPopularProductList();
    Get.find<UserController>().setUser();

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'GetX Store',

      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 50),
            backgroundColor: AppColors.spaceBlue,
          ),
        ),
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            backgroundColor: Colors.white70,
            elevation: 3,
          ),
        ),
      ),
      // themeMode: themeController.theme,
      // home: const MyHomePage(),
      home: FutureBuilder(
          future: AuthController.initializeUserCache(),
          builder: (context, dataSnapShot) {
            if (dataSnapShot.data == null) {
              return const LoginScreen();
            } else {
              return const MainPageScreen();
            }
          }),
    );
  }
}
