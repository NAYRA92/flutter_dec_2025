import 'package:flutter/material.dart';


class TestOnboarding extends StatefulWidget {
  const TestOnboarding({super.key});

  @override
  State<TestOnboarding> createState() => _TestOnboardingState();
}

class _TestOnboardingState extends State<TestOnboarding> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold
                ),),
                        
                Text("Special & Delisious",
                style: TextStyle(
                  fontSize: 11
                ),
                ),
              ],
            ),
        
            Column(
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                        
                  ),
                onPressed: (){}, 
                child: Text("Log In")),

                SizedBox(height: 10,),
                        
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey
                  ),
                onPressed: (){}, 
                child: Text("Sign Up")),
              ],
            ),
        
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset("images/kids.jpg", height: 250, width: 250, fit: BoxFit.cover,))
          ],
        ),
      ),
    );
  }
}