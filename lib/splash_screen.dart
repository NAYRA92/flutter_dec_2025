import 'package:flutter/material.dart';
import 'package:flutter_application_2912/app_theme.dart';
import 'package:flutter_application_2912/login_page.dart';
import 'package:lottie/lottie.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 3), (){
        Navigator.pushReplacement(context, 
        MaterialPageRoute(builder: (context)=> LoginPage()));
      }
    );
    return Scaffold(
      backgroundColor: kSecondaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset('images/logo.png', height: 150,),
            Lottie.asset(
              'images/Walking Orange.json',
              height: 100),
            Text("Foody",
            style: TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w200
            ),)
          ],
        ),
      ),
    );
  }
}