import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:penjualan_app/components/product_item.dart';
import 'package:penjualan_app/models/product.dart';

import 'bloc/product_bloc.dart';

class ProductScreen extends StatelessWidget {
  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ProductBloc bloc = BlocProvider.of<ProductBloc>(context);
    bloc.add(GetProduct());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ProductBloc, ProductState>(
                builder: (context, state) {
                  return state is ProductLoaded
                      ? ListView.builder(
                          itemCount: state.products.length,
                          itemBuilder: (context, index) {
                            return ProductItem(
                                productName: state.products[index].name,
                                isDiscount:
                                    state.products[index].isDiscount ?? false,
                                productRealPrice: state.products[index].price,
                                productDiscountPrice:
                                    state.products[index].discountPrice,
                                onTap: () => bloc
                                    .add(DetailProduct(state.products[index])),
                                onBuy: () {
                                  bloc.add(AddProduct(state.products[index]));
                                  var snackBar = SnackBar(
                                      content: Text(
                                          "${state.products[index].name} Berhasil ditambahkan!"));
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                });
                          })
                      : const Center(child: CircularProgressIndicator());
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 18),
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () => bloc.add(Checkout()),
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
