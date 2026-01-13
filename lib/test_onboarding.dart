import 'package:flutter/material.dart';

import 'app_theme.dart';


class TestOnboarding extends StatefulWidget {
  const TestOnboarding({super.key});

  @override
  State<TestOnboarding> createState() => _TestOnboardingState();
}

class _TestOnboardingState extends State<TestOnboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage("images/kids.jpg"),
                  radius: 50,
                ),
                Text("Food Bank",
                style: kHeaderDarkTextStyle
                ),
                        
                Text("Special & Delisious",
                style: TextStyle(
                  fontSize: 11
                ),
                ),
              ],
            ),
        
            Column(
              children: [
             kPrimaryButton("Log In", (){}),
             kPrimaryButton("Sign Up", (){}),

                        
              
              ],
            ),
        
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset("images/kids.jpg", height: 250, width: 350, fit: BoxFit.cover,))
          ],
        ),
      ),
    );
  }
}