import 'dart:developer';

import 'package:penjualan_app/app/login/bloc/login_bloc.dart';
import 'package:penjualan_app/models/product.dart';
import 'package:penjualan_app/models/user.dart';

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
  static Future<User?> getUser(Store store, String username) async {
    List<User> logins = store.box<User>().getAll();
    try {
      return logins.firstWhere((element) => element.username == username);
    } catch (e) {
      return null;
    }
  }

  /// Put user
  static Future<int> putUser(Store store) async {
    return store.box<User>().put(User(username: 'admin', password: 'admin'));
  }

  /// Put product
  static Future<List<int>> putProduct(Store store) async {
    return store.box<Product>().putMany([
      Product(
          name: 'So Klin Pewangi',
          price: 15000,
          discountPrice: 13500,
          isDiscount: true),
      Product(name: 'So Klin Liquid', price: 18000),
      Product(name: 'Giv Biru', price: 11000),
      Product(name: 'Giv Kuning', price: 10000)
    ]);
  }

  /// truncate data
  static Future<bool> truncateData(Store store) async {
    store.box<User>().removeAll();
    store.box<Product>().removeAll();
    return true;
  }
}
