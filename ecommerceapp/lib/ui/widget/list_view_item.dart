// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:ecommerceapp/ui/model/product.dart';
import 'package:flutter/material.dart';

class ListViewItem extends StatelessWidget {
  final List<ProductModel> productList;
  const ListViewItem({
    Key? key,
    required this.size,
    required this.ontap,
    required this.productList,
  }) : super(key: key);

  final Size size;
  final Function(ProductModel) ontap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: SizedBox(
          height: size.height * 0.25,
          width: size.width,
          child: ListView.builder(
              itemCount: productList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                ProductModel product = productList[index];
                return GestureDetector(
                  onTap: () {
                    ontap(product);
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                            product.img.toString(),
                            fit: BoxFit.cover,
                            height: size.height * 0.15,
                            width: size.width * 0.3,
                          ),
                        ),
                        RichText(
                          text: TextSpan(
                              text: '\$${product.unitPrice.toString()}  ',
                              style: const TextStyle(color: Colors.redAccent),
                              children: [
                                TextSpan(
                                    text: "\$${product.totalPrice.toString()}",
                                    style: const TextStyle(color: Colors.black))
                              ]),
                        ),
                        Text(
                          product.productName.toString(),
                          overflow: TextOverflow.ellipsis,
                        )
                      ],
                    ),
                  ),
                );
              })),
    );
  }
}
