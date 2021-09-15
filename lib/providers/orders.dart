import 'dart:math';

import 'package:flutter/foundation.dart';

import '/providers/cart.dart';

class Order {
  final String id;
  final double total;
  final List<CartItem> products;
  final DateTime date;

  Order(
      {required this.id,
      required this.total,
      required this.products,
      required this.date});
}

class Orders with ChangeNotifier {
  List<Order> _order = [];

  List<Order> get orders {
    return [..._order];
  }

  void addOrder(Cart cart) {
    _order.insert(
      0,
      Order(
        id: Random().nextDouble().toString(),
        total: cart.totalAmount,
        products: cart.item.values.toList(),
        date: DateTime.now(),
      ),
    );
    notifyListeners();
  }
}
