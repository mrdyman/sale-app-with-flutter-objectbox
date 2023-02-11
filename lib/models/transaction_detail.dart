import 'package:objectbox/objectbox.dart';

@Entity()
class TransactionDetail {
  @Id()
  int id;
  String documentCode;
  String documentNumber;
  String productCode;
  int price;
  int quantity;
  String unit;
  int subTotal;
  String currency;

  TransactionDetail({
    this.id = 0,
    required this.documentCode,
    required this.documentNumber,
    required this.productCode,
    required this.price,
    required this.quantity,
    required this.unit,
    required this.subTotal,
    required this.currency,
  });
}
