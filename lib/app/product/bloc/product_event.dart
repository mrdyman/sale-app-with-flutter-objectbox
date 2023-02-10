part of 'product_bloc.dart';

@immutable
abstract class ProductEvent {}

class AddProduct extends ProductEvent {
  final Product product;
  AddProduct(this.product);
}

class DetailProduct extends ProductEvent {
  final Product product;
  DetailProduct(this.product);
}

class GetProduct extends ProductEvent {}

class Checkout extends ProductEvent {}
