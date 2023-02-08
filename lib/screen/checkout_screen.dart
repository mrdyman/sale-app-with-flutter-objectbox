import 'package:flutter/material.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});

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
                    children: const [
                      Text(
                        'Total : ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Rp. 45.000,-',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 18),
            child: Row(
              children: [
                Container(
                  width: 75,
                  height: 75,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(55),
                      color: Colors.blue),
                ),
                const SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'So Klin Liquid',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        SizedBox(
                            width: 25,
                            child: FloatingActionButton(
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
                      children: const [
                        Text(
                          'Sub Total : ',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Rp. 18.000,-',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
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
}
