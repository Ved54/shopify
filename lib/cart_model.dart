import 'package:flutter/material.dart';

class CartItem {
  final String image;
  final String company;
  final String title;
  final String price;
  final String cutoff;
  int quantity;

  CartItem({
    required this.image,
    required this.company,
    required this.title,
    required this.price,
    required this.cutoff,
    this.quantity = 1,
  });
}

class CartProvider extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  int get itemCount => _items.length;

  double get totalAmount {
    double total = 0;
    for (var item in _items) {
      total += double.parse(item.price) * item.quantity;
    }
    return total;
  }

  bool isInCart(String title) {
    return _items.any((item) => item.title == title);
  }

  void addItem({
    required String image,
    required String company,
    required String title,
    required String price,
    required String cutoff,
  }) {
    if (!isInCart(title)) {
      _items.add(CartItem(
        image: image,
        company: company,
        title: title,
        price: price,
        cutoff: cutoff,
      ));
      notifyListeners();
    }
  }

  void removeItem(String title) {
    _items.removeWhere((item) => item.title == title);
    notifyListeners();
  }

  void incrementQuantity(String title) {
    final index = _items.indexWhere((item) => item.title == title);
    if (index >= 0) {
      _items[index].quantity++;
      notifyListeners();
    }
  }

  void decrementQuantity(String title) {
    final index = _items.indexWhere((item) => item.title == title);
    if (index >= 0) {
      if (_items[index].quantity > 1) {
        _items[index].quantity--;
      } else {
        _items.removeAt(index);
      }
      notifyListeners();
    }
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}