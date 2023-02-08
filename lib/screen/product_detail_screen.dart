import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 55),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(55), color: Colors.blue),
            child: const Icon(
              Icons.image,
              size: 45,
              color: Colors.white,
            ),
          ),
          const SizedBox(height: 25),
          const Text(
            'So Klin Pewangi',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Price',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Rp. 18.000,-',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Dimension',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                '13 cm X 10 cm',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                'Price Unit',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'PCS',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const SizedBox(height: 50),
          SizedBox(
              width: 200,
              height: 40,
              child: ElevatedButton(
                onPressed: () => 1,
                style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
                child: const Text(
                  'BUY',
                  style: TextStyle(fontSize: 18),
                ),
              ))
        ]),
      ),
    );
  }
}
