import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String productName;
  final int? productDiscountPrice;
  final int productRealPrice;
  final bool isDiscount;
  const ProductItem({
    required this.productName,
    this.productDiscountPrice,
    required this.productRealPrice,
    required this.isDiscount,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(children: [
        Container(
          width: 70,
          height: 70,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(45), color: Colors.blue),
        ),
        const SizedBox(width: 50),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              productName,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
            ),
            const SizedBox(height: 10),
            if (isDiscount)
              Text(
                "Rp. $productRealPrice,-",
                style: const TextStyle(decoration: TextDecoration.lineThrough),
              ),
            Text(isDiscount
                ? "Rp. $productDiscountPrice,-"
                : "Rp. $productRealPrice,-"),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => 1,
              style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              child: const Text(
                'BUY',
                style: TextStyle(fontSize: 15),
              ),
            )
          ],
        )
      ]),
    );
  }
}
