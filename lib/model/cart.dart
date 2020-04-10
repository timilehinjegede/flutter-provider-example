import 'dart:collection';

import 'package:flutter/material.dart';

class CartModel extends ChangeNotifier {
  final List<Item> _items = [];

  final int unitPrice = 50;

  UnmodifiableListView<Item> get items => UnmodifiableListView(_items);

  void addItem(int id, Item item) {
    _items.add(item);
    notifyListeners();
  }

  void clearItem() {
    _items.clear();
    notifyListeners();
  }

  int quantity(int id) {
    return _items[id].quantity;
  }

  int get totalPrice {
    int total = 0;

    for (int i = 0; i < _items.length; i++) {
      total += _items[i].quantity * unitPrice;
    }
    return total;
  }
}

class Item {
  final int id;
  final String name;
  int quantity;

  Item(this.id, this.name, this.quantity);
}
