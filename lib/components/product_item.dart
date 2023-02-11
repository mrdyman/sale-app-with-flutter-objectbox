import 'package:flutter/material.dart';

class ProductItem extends StatelessWidget {
  final String productName;
  final int price;
  final int discount;
  final bool isDiscount;
  final Function() onTap;
  final Function() onBuy;
  const ProductItem({
    required this.productName,
    required this.price,
    required this.discount,
    required this.isDiscount,
    required this.onTap,
    required this.onBuy,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: onTap,
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
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              const SizedBox(height: 10),
              if (isDiscount)
                Text(
                  "Rp. $price,-",
                  style:
                      const TextStyle(decoration: TextDecoration.lineThrough),
                ),
              Text(isDiscount ? "Rp. ${price - discount},-" : "Rp. $price,-"),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () => onBuy(),
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                child: const Text(
                  'BUY',
                  style: TextStyle(fontSize: 15),
                ),
              )
            ],
          )
        ]),
      ),
    );
  }
}
