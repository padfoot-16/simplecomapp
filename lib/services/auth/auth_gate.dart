import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simple_ecom_app/pages/intro.dart';
import 'package:simple_ecom_app/services/auth/login_or_register.dart';



class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          //if user logged in 
          if(snapshot.hasData){
            return const IntroPage();
          }
          //if user is not logged in
          else{
            return const LoginOrRegistre();
          }
        },
      ),
    );
  }
}