import 'package:ecommerceapp/constants/color_const.dart';
import 'package:ecommerceapp/controller/productcontroller.dart';
import 'package:ecommerceapp/ui/model/product.dart';
import 'package:ecommerceapp/ui/screen/product_details_screen.dart';
import 'package:ecommerceapp/ui/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class ViewAllProduct extends StatefulWidget {
  const ViewAllProduct({super.key});

  @override
  State<ViewAllProduct> createState() => _ViewAllProductState();
}

class _ViewAllProductState extends State<ViewAllProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.spaceBlue,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 10,
            ),
            alignment: Alignment.topLeft,
            child: const Text(
              'Keep shopping for ',
              style: TextStyle(
                fontSize: 20,
              ),
            ),
          ),
          Expanded(child:
              GetBuilder<PopularProductController>(builder: (popularProduct) {
            return GridView.builder(
                padding: const EdgeInsets.only(left: 15),
                itemCount: popularProduct.popularProductList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 0.8,
                  mainAxisSpacing: 0,
                ),
                itemBuilder: (context, index) {
                  ProductModel product =
                      popularProduct.popularProductList[index];
                  return ProductCard(
                    product: product,
                    ontap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.fade,
                          child: ProductDetails(
                            product: product,
                          ),
                        ),
                      );
                    },
                  );
                });
          })),
        ],
      ),
    );
  }
}
