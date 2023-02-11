part of 'product_detail_bloc.dart';

@immutable
abstract class ProductDetailEvent {}

class BuyProduct extends ProductDetailEvent {
  final Product product;
  BuyProduct(this.product);
}
