import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecom_app/models/product.dart';
import 'package:simple_ecom_app/models/shop.dart';

class MyProducttile extends StatelessWidget {
  final Product product;

  const MyProducttile({super.key, required this.product});

  void addTocart(BuildContext context) {
      final FirebaseAuth _firebaseauth = FirebaseAuth.instance;
      //get current user info
    final String currentUserId = _firebaseauth.currentUser!.uid;
    final String currentUseremail = _firebaseauth.currentUser!.email.toString();
      
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text("Add this item to your cart"),
        actions: [
          MaterialButton(
              onPressed: () => Navigator.pop(context), 
              child: Text("Cancel")),
          MaterialButton(
              onPressed: () {
                Navigator.pop(context);
                context.read<Shop>().addToCart(product,currentUserId,currentUseremail);
              }, 
              child: Text("Yes")),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(20)),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12)),
                    padding: EdgeInsets.all(25),
                    width: double.infinity,
                    child: Image.asset(product.imagePath)),
              ),
              SizedBox(
                height: 25,
              ),
              //prod name
              Text(
                product.name,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
              //prod desc
              SizedBox(
                height: 10,
              ),
              Text(
                product.desc,
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ],
          ),

          //prod price+add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$' + product.price.toStringAsFixed(2)),
              IconButton(
                  onPressed: () => addTocart(context),
                  icon: Container(
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Theme.of(context).colorScheme.secondary,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Icon(Icons.add)))
            ],
          ),
        ],
      ),
    );
  }
}
