import 'package:flutter/material.dart';

import '../../models/product.dart';

class CheckoutScreen extends StatefulWidget {
  final List<Product> products;
  const CheckoutScreen({required this.products, super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<Product> products = [];
  late int totalPrice;

  @override
  void initState() {
    products = widget.products;
    countTotalPrice();
    super.initState();
  }

  void countTotalPrice() {
    int tmpTotal = 0;
    for (var element in products) {
      if (element.discountPrice != null) {
        tmpTotal += element.discountPrice!;
      } else {
        tmpTotal += element.price;
      }
    }
    totalPrice = tmpTotal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(children: [
          const Text(
            'CHECKOUT',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total : ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "Rp. $totalPrice,-",
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: widget.products.length,
                itemBuilder: (context, index) {
                  return buildItem(
                      index: index, product: widget.products[index]);
                }),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: 150,
            height: 40,
            child: ElevatedButton(
              onPressed: () => 1,
              style: ElevatedButton.styleFrom(shape: const StadiumBorder()),
              child: const Text(
                'CONFIRM',
                style: TextStyle(fontSize: 15),
              ),
            ),
          )
        ]),
      ),
    );
  }

  Padding buildItem({required int index, required Product product}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
      child: Row(
        children: [
          Container(
            width: 75,
            height: 75,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(55), color: Colors.blue),
          ),
          const SizedBox(width: 25),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                product.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  SizedBox(
                      width: 25,
                      child: FloatingActionButton(
                        heroTag: "btn-remove$index",
                        onPressed: () => 1,
                        child: const Icon(Icons.remove),
                      )),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(border: Border.all()),
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        '1',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  SizedBox(
                      width: 25,
                      child: FloatingActionButton(
                        heroTag: "btn-add$index",
                        onPressed: () => 1,
                        child: const Icon(Icons.add, size: 15),
                      )),
                  const SizedBox(width: 15),
                  const Text(
                    'PCS',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  const Text(
                    'Sub Total : ',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    product.discountPrice != null
                        ? "Rp. ${product.discountPrice},-"
                        : "Rp. ${product.price},-",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
