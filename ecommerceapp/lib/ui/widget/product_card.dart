// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerceapp/ui/model/product.dart';

import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({
    Key? key,
    required this.product,
    required this.ontap,
  }) : super(key: key);
  final ProductModel product;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          SizedBox(
            height: 130,
            child: DecoratedBox(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black12,
                  width: 0.5,
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Image.network(
                  product.img.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.only(
              left: 0,
              top: 5,
              right: 15,
            ),
            child: Text(
              product.productName.toString(),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
    );
  }
}
