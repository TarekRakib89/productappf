import 'package:ecommerceapp/style/style_input.dart';
import 'package:flutter/material.dart';

class QunatityWidget extends StatelessWidget {
  const QunatityWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Quantity', style: TextStyle(fontSize: 25)),
        Row(
          children: [
            SizedBox(
              width: 50,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: applyButtonStyle(),
                child: const Icon(Icons.remove),
              ),
            ),
            SizedBox(
              width: 35,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: applyButtonStyle(),
                child: const Text('8'),
              ),
            ),
            SizedBox(
              width: 55,
              height: 40,
              child: ElevatedButton(
                onPressed: () {},
                style: applyButtonStyle(),
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
