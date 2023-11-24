import 'package:ecommerceapp/ui/widget/button_widget.dart';
import 'package:flutter/material.dart';

class SizedWidget extends StatelessWidget {
  const SizedWidget({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Size',
          style: TextStyle(fontSize: 25),
        ),
        SizedBox(
          width: size.height * 0.3,
          child: const SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                ButtonWidget(
                  size: '6',
                  color: Colors.grey,
                ),
                ButtonWidget(
                  size: '7',
                  color: Colors.grey,
                ),
                ButtonWidget(
                  size: '8',
                  color: Colors.redAccent,
                ),
                ButtonWidget(
                  size: '9',
                  color: Colors.grey,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
