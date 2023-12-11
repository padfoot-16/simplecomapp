import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecom_app/components/my_drawer.dart';
import 'package:simple_ecom_app/components/my_product_tile.dart';
import 'package:simple_ecom_app/models/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final products=context.watch<Shop>().shop;

    return Scaffold(
      appBar: AppBar(
      title: Center(child: Text("Shop Page")),
      backgroundColor: Colors.transparent,
      actions: [
        IconButton(icon:Icon(Icons.shopping_cart), onPressed: () => Navigator.pushNamed(context, "/cart_page") )
      ],
      elevation: 0,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      drawer:MyDrawer() ,
      body: ListView(
        children: [
          SizedBox(height: 25,),
          //shop subtitle
            Center(child: Text("Pick From a selected list of premium products",style:TextStyle(color: Theme.of(context).colorScheme.inversePrimary))),
          //product list 
          SizedBox(
        height: 550,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: products.length,
          padding: EdgeInsets.all(15),
          itemBuilder: (context, index) {
          final product=products[index];
        
          return MyProducttile(product: product);
        } ,),
      ),
        ],
      )
    );
  }
}