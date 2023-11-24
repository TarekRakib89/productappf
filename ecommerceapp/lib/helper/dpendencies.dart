import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/controller/productcontroller.dart';
import 'package:ecommerceapp/controller/user_controller.dart';
import 'package:ecommerceapp/data/api/apiclient.dart';
import 'package:ecommerceapp/data/repository/product_repo.dart';
import 'package:ecommerceapp/data/repository/user_repository.dart';
import 'package:ecommerceapp/utiles/AppConstants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  Get.lazyPut(() => ApiClient(appBaseUrl: AppConstants.BASE_URL));

  Get.lazyPut(() => ProductRepo(apiClient: Get.find()));
  Get.lazyPut(() => UserRepository(apiClient: Get.find()));

  Get.lazyPut(() => UserController(userRepository: Get.find()));
  Get.lazyPut(() => PopularProductController(popularProductRepo: Get.find()));
  Get.lazyPut(() => CartController());
}
