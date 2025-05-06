import 'package:flafee/screen/cashierboard.dart';
import 'package:flafee/screen/login_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class AppPages {
  static const initial = Routes.login;

  static final routes = [
    GetPage(
      name: Routes.login,
      page: () => LoginPage(),
      // binding: HomeBinding(), // Optional: untuk menghubungkan dengan controller (if any)
    ),
    GetPage(
      name: Routes.cashier,
      page: () => CashierBoard(),
      // binding: DetailsBinding(), // Optional: untuk menghubungkan dengan controller (if any)
    ),
  ];
}

class Routes {
  static const login = '/';
  static const cashier = '/cashierboard';
}
