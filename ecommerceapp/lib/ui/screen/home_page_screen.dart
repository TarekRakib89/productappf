import 'package:ecommerceapp/constants/color_const.dart';
import 'package:ecommerceapp/controller/productcontroller.dart';
import 'package:ecommerceapp/ui/screen/cart_page_screen.dart';
import 'package:ecommerceapp/ui/widget/search_cart_item.dart';
import 'package:ecommerceapp/ui/widget/image_slider_with_swiper.dart';
import 'package:ecommerceapp/ui/widget/list_view_item.dart';
import 'package:ecommerceapp/ui/widget/text_widget.dart';
import 'package:ecommerceapp/ui/model/product.dart';
import 'package:ecommerceapp/ui/screen/product_details_screen.dart';
import 'package:ecommerceapp/ui/screen/view_all_product.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';

class HomePageScreen extends StatelessWidget {
  const HomePageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
      children: [
        SizedBox(
          height: size.height * 0.33,
          width: size.width,
          child: Stack(
            children: [
              Container(
                height: size.height * 0.26,
                decoration: const BoxDecoration(
                  color: AppColors.spaceBlue,
                ),
              ),
              Positioned(
                top: size.height * 0.01,
                right: 0,
                left: 0,
                child: SearchAndCartItem(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return const CartPageScreen();
                    }));
                  },
                ),
              ),
              Positioned(
                top: size.height * 0.15,
                right: 0,
                left: 0,
                bottom: 0,
                child: ImageSliderWithSwiper(size: size),
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Textwidget(
          text1: 'Hot deals',
          text2: 'View all',
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const ViewAllProduct(),
              ),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return ListViewItem(
            size: size,
            ontap: (ProductModel product) {
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
            productList: popularProduct.popularProductList,
          );
        }),
        const SizedBox(
          height: 10,
        ),
        Textwidget(
          text1: "Weekly Top",
          text2: "View all",
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const ViewAllProduct(),
              ),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return ListViewItem(
            size: size,
            ontap: (ProductModel product) {
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
            productList: popularProduct.popularProductList,
          );
        }),
        const SizedBox(
          height: 10,
        ),
        Textwidget(
          text1: 'Trendy',
          text2: 'View all',
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                type: PageTransitionType.fade,
                child: const ViewAllProduct(),
              ),
            );
          },
        ),
        const SizedBox(
          height: 10,
        ),
        GetBuilder<PopularProductController>(builder: (popularProduct) {
          return ListViewItem(
            size: size,
            ontap: (ProductModel product) {
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
            productList: popularProduct.popularProductList,
          );
        }),
      ],
    ));
  }
}
