import 'package:penjualan_app/models/product.dart';
import 'package:penjualan_app/models/login.dart';
import 'package:penjualan_app/models/transaction_detail.dart';
import 'package:penjualan_app/models/transaction_header.dart';

import 'objectbox.g.dart';

class Objectbox {
  late final Store store;
  late final Admin admin;
  static late Store store_;
  static bool init = false;

  Objectbox._create(this.store) {
    store_ = store;
    if (Admin.isAvailable()) {
      admin = Admin(store_);
    }
    init = true;
  }

  static Future<Objectbox> create() async {
    if (await isStoreOpen()) {
      store_.close();
    }
    final store = await openStore();
    return Objectbox._create(store);
  }

  static Future<bool> isStoreOpen() async {
    if (init) {
      return true;
    }
    return false;
  }
}

class DBHelper {
  /// Get all products
  static Future<List<Product>> getProduct(Store store) async {
    List<Product> products = store.box<Product>().getAll();
    return products;
  }

  /// Get user
  static Future<Login?> getUser(Store store, String username) async {
    List<Login> logins = store.box<Login>().getAll();
    try {
      return logins.firstWhere((element) => element.username == username);
    } catch (e) {
      return null;
    }
  }

  /// Put user
  static Future<int> putUser(Store store) async {
    return store.box<Login>().put(Login(username: 'admin', password: 'admin'));
  }

  /// Put product
  static Future<List<int>> putProduct(Store store) async {
    return store.box<Product>().putMany([
      Product(
        productCode: "P001",
        unit: "PCS",
        currency: "IDR",
        dimension: "10cm x 15 cm",
        productName: 'So Klin Pewangi',
        price: 15000,
        discount: 1500,
      ),
      Product(
        productCode: "P002",
        unit: "PCS",
        currency: "IDR",
        dimension: "15cm x 25 cm",
        productName: 'So Klin Liquid',
        price: 18000,
        discount: 0,
      ),
      Product(
        productCode: "P003",
        unit: "PCS",
        currency: "IDR",
        dimension: "35cm x 15 cm",
        productName: 'Giv Biru',
        price: 11000,
        discount: 0,
      ),
      Product(
        productCode: "P004",
        unit: "PCS",
        currency: "IDR",
        dimension: "15cm x 15 cm",
        productName: 'Giv Kuning',
        price: 10000,
        discount: 0,
      ),
    ]);
  }

  /// Put transactions
  static Future putTransaction(Store store,
      {required List<TransactionDetail> transactionDetails,
      required TransactionHeader transactionHeader}) async {
    store.box<TransactionDetail>().putMany(transactionDetails);
    store.box<TransactionHeader>().put(transactionHeader);
  }

  /// truncate data
  static Future<bool> truncateData(Store store) async {
    store.box<Login>().removeAll();
    store.box<Product>().removeAll();
    store.box<TransactionDetail>().removeAll();
    store.box<TransactionHeader>().removeAll();
    return true;
  }
}
