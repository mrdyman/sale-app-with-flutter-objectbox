import 'package:flutter/material.dart';
import 'package:penjualan_app/components/product_item.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return const ProductItem(
                      productName: "So Klin Pewangi",
                      isDiscount: true,
                      productRealPrice: 15000,
                      productDiscountPrice: 13000,
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () => 1,
                  style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                  child: const Text(
                    'CHECKOUT',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
