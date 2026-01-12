// import 'package:flutter/material.dart';
// import 'package:water_drop_nav_bar/water_drop_nav_bar.dart';

// int _selectedIndex = 0;
// class UsefulWidgets extends StatelessWidget {
//   const UsefulWidgets({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.network(
//               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkzXe1N7DYvsku6LJytS-ZkCsuFC4YYRMlppBolkPqyhPlbxNCcMl9nv_gbBZkGl4jGhI&usqp=CAU",
//             ),
//             SizedBox(height: 20),
//             Text("UserName"),
//             SizedBox(height: 10),
//             Text("Password"),
//             SizedBox(height: 40),
//             ElevatedButton(onPressed: () {}, child: Text("LogIn")),
//           ],
//         ),
//       ),

//       // SingleChildScrollView(
//       //   scrollDirection: Axis.horizontal,
//       //   child: Row(
//       //     children: [
//       //       Container(
//       //         height: 200,
//       //         width: 200,
//       //         color: Colors.amber,
//       //       ),

//       //        Container(
//       //         height: 200,
//       //         width: 200,
//       //         color: Colors.amber[100],
//       //       ),

//       //        Container(
//       //         height: 200,
//       //         width: 200,
//       //         color: Colors.amber[200],
//       //       ),
//       //     ],
//       //   ),
//       // )

//       // Container(
//       //   height: double.infinity,
//       //   width: double.infinity,
//       //   margin: EdgeInsets.all(50),
//       //   decoration: BoxDecoration(
//       //   color: Colors.green,
//       //   borderRadius: BorderRadius.circular(25),
//       //   border: Border.all(
//       //     width: 5,
//       //     color: Colors.amberAccent,
//       //   ),
//       //   image: DecorationImage(
//       //     image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRkzXe1N7DYvsku6LJytS-ZkCsuFC4YYRMlppBolkPqyhPlbxNCcMl9nv_gbBZkGl4jGhI&usqp=CAU"),
//       //     fit: BoxFit.cover,
//       //     alignment: Alignment.bottomCenter,
//       //     opacity: 0.2
//       //     ),
//       //   boxShadow: [
//       //     BoxShadow(
//       //       blurRadius: 10,
//       //       spreadRadius: 10,
//       //       offset: Offset(3, 5)
//       //     )
//       //   ],
//       //   ),
//       //   child: Text("Here"),
//       // )
//       bottomNavigationBar: WaterDropNavBar(
//         barItems:
//         [ 
//           BarItem(
//           filledIcon: Icons.favorite, 
//         outlinedIcon: Icons.favorite_outline),
//           BarItem(
//           filledIcon: Icons.home, 
//         outlinedIcon: Icons.home_max_outlined),
//           BarItem(
//           filledIcon: Icons.message, 
//         outlinedIcon: Icons.message_outlined),
// ]
//         // selectedIndex: selectedIndex,
//         onItemSelected: (index){

//         },
//       ),
//     );
//   }
// }




// // Stack(
// //         clipBehavior: Clip.none,
// //         children: [
// //           Container(
// //             // margin: EdgeInsets.only(
// //             //   // 30
// //             //   bottom: 30,
// //             //   right: 30
// //             // ),
// //             height: 300,
// //             width: 300,
// //             color: Colors.black,
// //           ),
// //           Positioned(
// //             bottom: -50,
// //             right: 10,
// //             child: Container(
// //               height: 100,
// //               width: 100,
// //               color: Colors.red,
// //             ),
// //           ),

// //            Positioned(
// //             right: -50,
// //             top: 10,
// //             child: Container(
// //               height: 100,
// //               width: 100,
// //               color: Colors.red,
// //             ),
// //           )
// //         ],
// //       )