// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:ecommerceapp/style/style_input.dart';
import 'package:flutter/material.dart';

class SearchAndCartItem extends StatelessWidget {
  const SearchAndCartItem({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(30),
              child: TextField(
                style: const TextStyle(
                  color: Colors.black,
                ),
                decoration:
                    applyInputDecoration(text: 'iMac', iconData: Icons.search),
              ),
            ),
          ),
          Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.deepOrangeAccent),
              child: GestureDetector(
                onTap: onTap,
                child: const Icon(
                  Icons.shopping_cart_outlined,
                  color: Colors.white,
                ),
              ))
        ],
      ),
    );
  }
}
