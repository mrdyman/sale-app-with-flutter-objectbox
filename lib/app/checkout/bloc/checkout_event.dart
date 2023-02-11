part of 'checkout_bloc.dart';

@immutable
abstract class CheckoutEvent {}

class Checkout extends CheckoutEvent {
  final List<TransactionDetail> transactionsDetail;
  final TransactionHeader transactionHeader;
  Checkout(this.transactionsDetail, this.transactionHeader);
}
