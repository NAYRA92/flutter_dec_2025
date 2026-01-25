import 'package:flutter/material.dart';
import 'package:flutter_application_2912/project_files/login_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(
      Duration(seconds: 1),
      (){
        Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context)=> LoginScreen()));
      }
    );
    return Scaffold(
      backgroundColor: Colors.amber[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/logo.png', height: 150,),
            Text("Foody", style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold
            ),)
          ],
        ),
      ),
    );
  }
}