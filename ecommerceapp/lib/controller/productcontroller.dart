import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/data/repository/product_repo.dart';
import 'package:ecommerceapp/ui/model/product.dart';

import 'package:get/get.dart';

class PopularProductController extends GetxController {
  final ProductRepo popularProductRepo;
  PopularProductController({required this.popularProductRepo});
  List<ProductModel> _popularProductList = [];
  List<ProductModel> get popularProductList => _popularProductList;
  late CartController _cartController;
  // bool _isLoaded = false;
  // bool get isLoaded => _isLoaded;

  Future<void> getPopularProductList() async {
    Response response = await popularProductRepo.getProductList();
    if (response.statusCode == 200) {
      if (response.body['status'] == 'success') {
        _popularProductList = [];
        for (Map<String, dynamic> productJson in response.body['data']) {
          _popularProductList.add(ProductModel.fromJson(productJson));
        }
      }
      update();
    } else {}
  }

  void addProductToCart(ProductModel product, CartController cart) {
    _cartController = cart;
    _cartController.addProductToCart(product, 1);
    update();
  }
}
