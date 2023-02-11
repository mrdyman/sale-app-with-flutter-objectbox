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

  TransactionDetail copyWith({
    int? id,
    String? documentCode,
    String? documentNumber,
    String? productCode,
    int? price,
    int? quantity,
    String? unit,
    int? subTotal,
    String? currency,
  }) =>
      TransactionDetail(
        id: id ?? this.id,
        documentCode: documentCode ?? this.documentCode,
        documentNumber: documentNumber ?? this.documentNumber,
        productCode: productCode ?? this.productCode,
        price: price ?? this.price,
        quantity: quantity ?? this.quantity,
        unit: unit ?? this.unit,
        subTotal: subTotal ?? this.subTotal,
        currency: currency ?? this.currency,
      );
}
