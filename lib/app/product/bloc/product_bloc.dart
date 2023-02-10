import 'package:context_holder/context_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:penjualan_app/app/checkout/checkout_screen.dart';
import 'package:penjualan_app/app/login/login_screen.dart';
import 'package:penjualan_app/app/product_detail/product_detail_screen.dart';
import 'package:penjualan_app/models/helper.dart';
import 'package:penjualan_app/models/product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  BuildContext context = ContextHolder.currentContext;
  ProductBloc() : super(ProductInitial()) {
    List<Product> products = [];
    on<AddProduct>((event, emit) {
      products.add(event.product);
    });

    on<GetProduct>((event, emit) async {
      List<Product> dataProduct = await getProducts();
      emit(ProductLoaded(dataProduct));
    });

    on<DetailProduct>((event, emit) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  ProductDetailScreen(product: event.product)));
    });

    on<Checkout>((event, emit) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => CheckoutScreen(
                    products: products,
                  )));
    });
  }

  Future<List<Product>> getProducts() async {
    return await DBHelper.getProduct(Objectbox.store_);
  }
}
