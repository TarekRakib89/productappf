// ignore_for_file: public_member_api_docs, sort_constructors_first
// import 'package:ecommerceapp/color_const.dart';

import 'package:ecommerceapp/constants/color_const.dart';
import 'package:ecommerceapp/controller/cart_controller.dart';

import 'package:ecommerceapp/controller/productcontroller.dart';

import 'package:ecommerceapp/ui/model/product.dart';

import 'package:ecommerceapp/ui/widget/quantity_widget.dart';
import 'package:ecommerceapp/ui/widget/size_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetails extends StatelessWidget {
  const ProductDetails({
    Key? key,
    required this.product,
  }) : super(key: key);
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.sizeOf(context);

    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.spaceBlue,
      // ),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Padding(
            padding: EdgeInsets.all(size.height * 0.028),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(
                      Icons.arrow_back_sharp,
                      size: 30,
                    ),
                  ),
                  const Text(
                    'Energy Cloud',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  const Icon(Icons.favorite_border_outlined)
                ]),
          ),
          Stack(
            children: [
              SizedBox(
                width: MediaQuery.sizeOf(context).width,
                height: MediaQuery.sizeOf(context).height * 0.3,
                child: Image.network(
                  product.img.toString(),
                  fit: BoxFit.contain,
                  width: MediaQuery.sizeOf(context).width,
                  height: MediaQuery.sizeOf(context).height,
                ),
              ),
              Positioned(
                top: size.height * 0.26,
                left: size.width * 0.1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Rating"),
                    Row(
                      children: [
                        const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        RichText(
                          text: const TextSpan(
                              text: '4.5  ',
                              style: TextStyle(
                                color: Color.fromARGB(255, 160, 144, 4),
                              ),
                              children: [
                                TextSpan(
                                    text: "(300 people)",
                                    style: TextStyle(color: Colors.black)),
                              ]),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Product Description',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(14.0),
                  child: Wrap(
                    children: [
                      Text(
                          "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 7,
                      child: SizedWidget(size: size),
                    ),
                    const Expanded(
                      flex: 5,
                      child: QunatityWidget(),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                const Text(
                  "Selected Color",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                SizedBox(
                  height: size.height * 0.1,
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Price",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    product.totalPrice.toString(),
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 40,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
          GetBuilder<PopularProductController>(builder: (popularProduct) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: ElevatedButton(
                  onPressed: () {
                    popularProduct.addProductToCart(
                        product, Get.find<CartController>());
                  },
                  style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50),
                    backgroundColor: AppColors.spaceBlue,
                  ),
                  child: const Text(
                    "Add to Cart",
                  )),
            );
          })
        ]),
      ),
    );
  }
}
