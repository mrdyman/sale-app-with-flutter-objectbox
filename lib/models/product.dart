import 'package:objectbox/objectbox.dart';

@Entity()
class Product {
  @Id()
  int id;
  String productCode;
  String productName;
  int price;
  String currency;
  int discount;
  String dimension;
  String unit;

  Product({
    this.id = 0,
    required this.productCode,
    required this.productName,
    required this.price,
    required this.currency,
    required this.discount,
    required this.dimension,
    required this.unit,
  });
}
