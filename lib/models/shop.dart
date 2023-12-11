import 'package:flutter/material.dart';
import 'package:simple_ecom_app/models/product.dart';

class Shop extends ChangeNotifier {
  //product for sale
  final List<Product> _shop = [
    Product(
        name: "Product 1",
        price: 99.99,
        desc: "Item desc...",
        // imagePath: imagePath
        ),
    Product(
        name: "Product 2",
        price: 99.99,
        desc: "Item desc...",
        // imagePath: imagePath
        ),
    Product(
        name: "Product 3",
        price: 99.99,
        desc: "Item desc...",
        // imagePath: imagePath
        ),
    Product(
        name: "Product 4",
        price: 99.99,
        desc: "Item desc...",
        // imagePath: imagePath
        ),
  ];
  //user cart
  List<Product> _cart=[

  ];
  //get product list
  List<Product> get shop=> _shop;
  //get user cart
  List<Product> get cart=> _cart;
  //add item to cart
  void addToCart(Product item){
    _cart.add(item);
    notifyListeners();
  }
  //remove item from cart
  void RemoveFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }
}
