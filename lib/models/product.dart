import 'package:objectbox/objectbox.dart';

@Entity()
class Product {
  @Id()
  int id;
  String name;
  int price;
  int? discountPrice;
  bool? isDiscount;

  Product(
      {this.id = 0,
      required this.name,
      required this.price,
      this.discountPrice,
      this.isDiscount = false});
}
