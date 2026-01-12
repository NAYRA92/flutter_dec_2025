import 'package:flutter/material.dart';
import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';


class WaterDropExample extends StatefulWidget {
  const WaterDropExample({super.key});

  @override
  State<WaterDropExample> createState() => _WaterDropExampleState();
}
int selectedIndex = 0;

class _WaterDropExampleState extends State<WaterDropExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: WaterDropNavBar
      (
      barItems: [
        BarItem(
          filledIcon: Icons.home, 
          outlinedIcon: Icons.home_outlined),
        BarItem(
          filledIcon: Icons.favorite, 
          outlinedIcon: Icons.favorite_outline_outlined),
        BarItem(
          filledIcon: Icons.message, 
          outlinedIcon: Icons.message_outlined)
      ], 
      selectedIndex: selectedIndex, 
      onItemSelected: (value){
        setState(() {
          selectedIndex = value;
        });
      }
      ),
    );
  }
}