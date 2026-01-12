import 'package:flutter/material.dart';

class InstaProfile extends StatefulWidget {
  const InstaProfile({super.key});

  @override
  State<InstaProfile> createState() => _InstaProfileState();
}

class _InstaProfileState extends State<InstaProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //AppBar Started
      appBar: AppBar(),

      //Home Started
      body: Column(
        children: [
          //Avatar and stats row
          Row(
            children: [
              CircleAvatar(),
              statsColumn("3", "Posts"),
              statsColumn("1025", "Followers"),
              statsColumn("25", "Following"),
              
            ],
          )
        ],
      ),

    );
  }

  Column statsColumn(
    String number,
    String text
  ) {
    return Column(
              children: [
                Text(number, 
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),),
                Text(text)
              ],
            );
  }
}