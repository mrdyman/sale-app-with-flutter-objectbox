import 'package:context_holder/context_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:penjualan_app/app/checkout/bloc/checkout_bloc.dart';
import 'package:penjualan_app/app/checkout/checkout_screen.dart';
import 'package:penjualan_app/app/login/login_screen.dart';
import 'package:penjualan_app/app/product_detail/product_detail_screen.dart';
import 'package:penjualan_app/models/helper.dart';
import 'package:penjualan_app/models/product.dart';
import 'package:penjualan_app/models/transaction_detail.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  BuildContext context = ContextHolder.currentContext;
  ProductBloc() : super(ProductInitial()) {
    List<TransactionDetail> transactions = [];
    on<AddProduct>((event, emit) {
      try {
        TransactionDetail transaction = transactions.firstWhere(
            (element) => element.productCode == event.product.productCode);

        int dataToRemove = transactions.indexWhere(
            (element) => element.productCode == event.product.productCode);
        //product already added, increase the quantity
        TransactionDetail tmpData = transaction.copyWith(
            quantity: transaction.quantity + 1,
            subTotal: transaction.subTotal * 2);

        transactions.removeAt(dataToRemove);
        transactions.add(tmpData);
      } catch (e) {
        //product never added before
        transactions.add(TransactionDetail(
          documentCode: "DC001",
          documentNumber: "DCN001",
          productCode: event.product.productCode,
          price: event.product.price - event.product.discount,
          quantity: 1,
          unit: event.product.unit,
          subTotal: event.product.price - event.product.discount,
          currency: event.product.currency,
        ));
      }
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

    on<Checkout>((event, emit) async {
      List<Product> products = await getProducts();
      moveToCheckout(transactions, products);
    });
  }

  moveToCheckout(List<TransactionDetail> transactions, List<Product> products) {
    Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider<CheckoutBloc>(
                  create: (context) => CheckoutBloc(),
                  child: CheckoutScreen(
                    transactions: transactions,
                    products: products,
                  ),
                )));
  }

  Future<List<Product>> getProducts() async {
    return await DBHelper.getProduct(Objectbox.store_);
  }
}
