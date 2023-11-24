import 'package:ecommerceapp/ui/model/cart.dart';
import 'package:ecommerceapp/ui/model/product.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  final Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addProductToCart(ProductModel product, int quantity) {
    var totalQuantity = 0;

    int id = int.parse(product.productCode!);
    if (_items.containsKey(id)) {
      _items.update(id, (value) {
        totalQuantity = value.quantity! + quantity;
        return CartModel(
          id: value.id,
          name: value.name,
          price: value.price,
          img: value.img,
          quantity: value.quantity! + quantity,
          isExit: true,
          time: DateTime.now().toString(),
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.productCode);
      }
    } else {
      _items.putIfAbsent(id, () {
        return CartModel(
          id: id,
          name: product.productName,
          price: int.parse(product.unitPrice ?? ''),
          img: product.img,
          quantity: quantity,
          isExit: true,
          time: DateTime.now().toString(),
        );
      });
    }
  }

  List<CartModel> get getItems {
    return _items.entries.map((e) {
      return e.value;
    }).toList();
  }

  int get totalPriceOfproduct {
    var price = 0;
    var totalPrice = 0;
    _items.forEach((key, value) {
      price = value.price! * value.quantity!;
      totalPrice += price;
    });
    return totalPrice;
  }
}
