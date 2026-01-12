import 'package:flutter/material.dart';
import 'package:flutter_application_2912/homepage.dart';
import 'package:flutter_application_2912/insta_pages/insta_explore.dart';
import 'package:flutter_application_2912/insta_pages/insta_home.dart';
import 'package:flutter_application_2912/insta_pages/insta_messages.dart';
import 'package:flutter_application_2912/insta_pages/insta_profile.dart';
import 'package:flutter_application_2912/insta_pages/insta_reels.dart';


class InstagramHomePage extends StatefulWidget {
  const InstagramHomePage({super.key});

  @override
  State<InstagramHomePage> createState() => _InstagramHomePageState();
}

class _InstagramHomePageState extends State<InstagramHomePage> {
  int selectedIndex = 0;

  List<Widget> layoutWidgets = [
    InstaHome(), // index 0
    InstaReels(),
    InstaMessages(),
    InstaExplore(),
    InstaProfile() // index 4
  ];

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: IndexedStack(
        index: selectedIndex,
        children: layoutWidgets,
      ),
    
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index){
          setState(() {
           selectedIndex = index;
          });
        },
        selectedItemColor: Colors.amber,
        unselectedItemColor: Colors.black54,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.video_library), label: "Reels"),
          BottomNavigationBarItem(
        icon: Icon(Icons.send), label: "Messages"),
          BottomNavigationBarItem(
            icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle), label: "Account"),
        ]
        ),
    );
  }


}