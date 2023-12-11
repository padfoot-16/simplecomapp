import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecom_app/components/mybutton.dart';
import 'package:simple_ecom_app/models/product.dart';
import 'package:simple_ecom_app/models/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeItemFromCart(BuildContext context, Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Remove this item from your cart"),
        actions: [
          MaterialButton(
              onPressed: () => Navigator.pop(context), child: Text("Cancel")),
          MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<Shop>().RemoveFromCart(product);
              },
              child: Text("Yes")),
        ],
      ),
    );
  }

  void payButtonPressed(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content:
            Text("User Wants to pay!connect this app to your payment backend"),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Cart Page"),
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: Column(
          children: [
            Expanded(
              child: cart.isEmpty
                  ? Center(child: Text("Your Cart Is Empty.."))
                  : ListView.builder(
                      itemCount: cart.length,
                      itemBuilder: (context, index) {
                        final item = cart[index];

                        return ListTile(
                          title: Text(item.name),
                          subtitle: Text(item.price.toStringAsFixed(2)),
                          trailing: IconButton(
                              onPressed: () =>
                                  removeItemFromCart(context, item),
                              icon: Icon(Icons.remove)),
                        );
                      },
                    ),
            ),
            Padding(
              padding: const EdgeInsets.all(50.0),
              child: MyButton(
                  onTap: () => payButtonPressed(context),
                  child: Text("Pay Now")),
            )
          ],
        ));
  }
}
