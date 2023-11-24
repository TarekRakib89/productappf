import 'package:ecommerceapp/constants/color_const.dart';
import 'package:ecommerceapp/controller/cart_controller.dart';
import 'package:ecommerceapp/ui/model/cart.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPageScreen extends StatelessWidget {
  const CartPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);
    CartController cart = Get.find<CartController>();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.darkBlue,
      ),
      body: SingleChildScrollView(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * 0.7,
              width: size.width * 0.9,
              child: GetBuilder<CartController>(builder: (cartController) {
                return ListView.builder(
                    itemCount: cartController.getItems.length,
                    itemBuilder: (context, index) {
                      CartModel cart = cartController.getItems[index];
                      int total = cart.price! * (cart.quantity as int);

                      return Padding(
                        padding: const EdgeInsets.only(top: 7),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Image.network(
                                    cart.img.toString(),
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  flex: 9,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        "Men's Shoes",
                                        style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SingleChildScrollView(
                                        scrollDirection: Axis.horizontal,
                                        child: Row(
                                          children: [
                                            Text(
                                              cart.price.toString(),
                                              style: const TextStyle(
                                                color: Colors.redAccent,
                                              ),
                                            ),
                                            const Icon(
                                              Icons.clear_outlined,
                                              size: 25,
                                            ),
                                            const SizedBox(
                                              width: 3,
                                            ),
                                            SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: TextButton(
                                                onPressed: () {},
                                                child: Center(
                                                    child: Text(
                                                  cart.quantity.toString(),
                                                  style: const TextStyle(
                                                      color: Colors.redAccent),
                                                )),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: TextButton(
                                                onPressed: () {},
                                                child: const Center(
                                                    child: Icon(
                                                  Icons.remove,
                                                  size: 25,
                                                )),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 50,
                                              height: 50,
                                              child: TextButton(
                                                onPressed: () {},
                                                child: const Center(
                                                    child: Icon(
                                                  Icons.add,
                                                  size: 25,
                                                )),
                                              ),
                                            ),
                                            const Icon(
                                              Icons.drag_handle_outlined,
                                              size: 25,
                                            ),
                                            Text(
                                              total.toString(),
                                              style:
                                                  const TextStyle(fontSize: 20),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      );
                    });
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: SizedBox(
                width: size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text(
                      'Total',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      cart.totalPriceOfproduct.toString(),
                      style: const TextStyle(
                        color: Colors.redAccent,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                        onPressed: () {},
                        child: const Text(
                          "Cheack Out",
                        ))
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
