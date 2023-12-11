import 'package:flutter/material.dart';
import 'package:simple_ecom_app/components/mybutton.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.trolley,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
            const SizedBox(height: 25),
            const Text("Minimal Shop",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
            const SizedBox(height: 10),
            Text("Premium Quality Products",
                style: TextStyle(
                    color: Theme.of(context).colorScheme.inversePrimary)),
            const SizedBox(height: 25),

            MyButton(onTap: () => Navigator.pushNamed(context, "/shop_page"), child: Icon(Icons.arrow_forward))        
          ],
        ),
      ),
    );
  }
}
