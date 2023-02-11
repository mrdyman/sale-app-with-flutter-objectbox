import 'package:objectbox/objectbox.dart';

@Entity()
class TransactionHeader {
  @Id()
  int id;
  String documentCode;
  String documentNumber;
  String user;
  int total;
  DateTime date;
  TransactionHeader(
      {this.id = 0,
      required this.documentCode,
      required this.documentNumber,
      required this.user,
      required this.total,
      required this.date});
}
