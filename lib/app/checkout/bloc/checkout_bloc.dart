import 'package:bloc/bloc.dart';
import 'package:context_holder/context_holder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:penjualan_app/app/product/bloc/product_bloc.dart';
import 'package:penjualan_app/app/product/product_screen.dart';
import 'package:penjualan_app/models/helper.dart';
import 'package:penjualan_app/models/transaction_detail.dart';
import 'package:penjualan_app/models/transaction_header.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  BuildContext context = ContextHolder.currentContext;
  CheckoutBloc() : super(CheckoutInitial()) {
    on<Checkout>((event, emit) async {
      await putTransaction(
          transactions: event.transactionsDetail,
          transactionHeader: event.transactionHeader);
      moveToProductList();
    });
  }

  Future putTransaction({
    required List<TransactionDetail> transactions,
    required TransactionHeader transactionHeader,
  }) async {
    await DBHelper.putTransaction(
      Objectbox.store_,
      transactionDetails: transactions,
      transactionHeader: transactionHeader,
    );
  }

  moveToProductList() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => BlocProvider<ProductBloc>(
                  create: (context) => ProductBloc(),
                  child: const ProductScreen(),
                )));
  }
}
