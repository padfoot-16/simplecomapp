import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:simple_ecom_app/models/shop.dart';
import 'package:simple_ecom_app/pages/cart_page.dart';
import 'package:simple_ecom_app/pages/intro.dart';
import 'package:simple_ecom_app/pages/shop_page.dart';
import 'package:simple_ecom_app/services/auth/auth_gate.dart';
import 'package:simple_ecom_app/services/auth/auth_service.dart';
import 'package:simple_ecom_app/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


void main() async {
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // runApp(
    // MultiProvider(providers: [
    //   ChangeNotifierProvider<AuthService>(create: (context) => AuthService(),
    //   child: MyApp(),
    //   ),
    //   ChangeNotifierProvider<Shop>(create: (context) => Shop(),
    //   child: ShopPage(),
    // )]));
    runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AuthService()),
        ChangeNotifierProvider(create: (context) => Shop()), // Add this line
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthGate(),
      theme: lightMode,
      routes: {
        '/intro_page': (context) => IntroPage(),
        '/shop_page': (context) => ShopPage(),
        '/cart_page': (context) => CartPage()
      },
    );
  }
}
