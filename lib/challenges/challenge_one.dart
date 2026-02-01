import 'package:flutter/material.dart';
import 'package:flutter_application_2912/project_files/constants/app_theme.dart';

class ChallengeOne extends StatefulWidget {
  const ChallengeOne({super.key});

  @override
  State<ChallengeOne> createState() => _ChallengeOneState();
}

class _ChallengeOneState extends State<ChallengeOne> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Nayra Hashem"), centerTitle: true),

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                headerContainer("To Be"),
                headerContainer("Or Not"),
                headerContainer("To Be"),
              ],
            ),

            Expanded(
              child: Container(
                margin: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(15),
                  image: DecorationImage(
                    image: NetworkImage(
                      "https://images.unsplash.com/photo-1555081944-c0c2f00d06e8?q=80&w=1470&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Center(child: Text("YOU CAN DO IT!",
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w500,
                    color: Colors.white.withAlpha(60),
                  ),)),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: kSecondaryColor,
                  shape: RoundedSuperellipseBorder(
                      borderRadius: BorderRadius.circular(10)
                    ),
                ),
                onPressed: () {},
                child: Text(
                  "Get Started",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget headerContainer(String text) {
    return Expanded(
      child: Container(
        height: 150,
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
