import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecom_app/components/my_listtile.dart';
import 'package:simple_ecom_app/services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});
  

  @override
  Widget build(BuildContext context) {
    // final currentuser = FirebaseAuth.instance.currentUser!;
    void signOut() {
    final authService = Provider.of<AuthService>(context, listen: false);
    authService.signOut();
    Navigator.pushNamed(context, "/auth_page");
    }

    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              DrawerHeader(
              child: Center(
            child: Column(
              children: [
                Icon(
                  Icons.trolley,
                  size: 100,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
                // Text(currentuser.email!)
              ],
            ),
          )),
          SizedBox(
            height: 25,
          ),
          MyListtile(
            icon: Icons.home,
            text: "Shop",
            onTap: () => Navigator.pop(context),
          ),
          MyListtile(
            icon: Icons.shopping_cart,
            text: "Cart",
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, "/cart_page");
            },
          ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 25),
            child: MyListtile(
              icon: Icons.logout,
              text: "Exit",
              onTap: signOut,
            ),
          ),
        ],
      ),
    );
  }
}
