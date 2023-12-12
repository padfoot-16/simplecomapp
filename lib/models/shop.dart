import 'package:flutter/material.dart';
import 'package:simple_ecom_app/models/product.dart';

class Shop extends ChangeNotifier {
  //product for sale
  final List<Product> _shop = [
    Product(
        name: "Blue Shoes",
        price: 23.99,
        desc: "Item desc...",
        imagePath:"lib/assets/blue.jpg" 
        ),
    Product(
        name: "Grey Shoes",
        price: 19.99,
        desc: "Item desc...",
        imagePath: "lib/assets/grey.jpg"
        ),
    Product(
        name: "White Shoes",
        price: 25.99,
        desc: "Item desc...",
        imagePath: "lib/assets/white.jpg"
        ),
    Product(
        name: "Pink Shoes",
        price: 23.99,
        desc: "Item desc...",
        imagePath: "lib/assets/pink.png"
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
