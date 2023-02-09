import 'package:penjualan_app/models/product.dart';

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
    final store = openStore();
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
}
