import 'package:flutter/material.dart';
import 'package:penjualan_app/models/transaction_detail.dart';

import '../../models/product.dart';

class CheckoutScreen extends StatefulWidget {
  final List<TransactionDetail> transactions;
  final List<Product> products;
  const CheckoutScreen(
      {required this.transactions, required this.products, super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  List<TransactionDetail> transactions = [];
  List<Product> products = [];
  late int totalPrice;

  @override
  void initState() {
    transactions = widget.transactions;
    products = widget.products;
    countTotalPrice();
    super.initState();
  }

  void countTotalPrice() {
    int tmpTotal = 0;
    for (var element in transactions) {
      tmpTotal += element.quantity > 1
          ? element.price * element.quantity
          : element.price;
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
                itemCount: widget.transactions.length,
                itemBuilder: (context, index) {
                  return buildItem(
                      index: index,
                      transaction: widget.transactions[index],
                      product: widget.products.firstWhere((element) =>
                          element.productCode ==
                          widget.transactions[index].productCode));
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

  Padding buildItem({
    required int index,
    required TransactionDetail transaction,
    required Product product,
  }) {
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
                product.productName,
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
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        transaction.quantity.toString(),
                        style: const TextStyle(fontWeight: FontWeight.bold),
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
                    "Rp. ${transaction.subTotal},-",
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
