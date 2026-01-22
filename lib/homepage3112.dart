import 'package:flutter/material.dart';

List<String> names = [
  "الاسم الاول", "الاسم الثاني", "name3",
  "name1", "name2", "name3",
  "name1", "name2", "name3",
  
  ];

List<String> messages = [
  'رسالة', 'رسالة', 'رسالة',
  'message1', 'message2', 'message2',
  'message1', 'message2', 'message2',
  
  ];

List<String> imges = [
      "images/camera.jpg",
      "images/camera.jpg",
      "images/kids.jpg",
      "images/camera.jpg",
      "images/camera.jpg",
      "images/camera.jpg",
      "images/camera.jpg",
      "images/camera.jpg",
      "images/camera.jpg",
  ];

class Homepage3112 extends StatelessWidget {
  const Homepage3112({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        iconTheme: IconThemeData(color: Colors.white),
        actions: [
          Icon(Icons.favorite),
          Icon(Icons.search),
          Icon(Icons.settings),
        ],
        title: Text("WhatsApp", style: TextStyle(color: Colors.white)),
      ),

      body: ListView.builder(
        itemCount: names.length,
        itemBuilder: (context, index) {
          return 
          chatTile(
            names[index], 
            messages[index],
            imges[index]
            );
        },
      ),

      //  ListView(
      //   children: [
      //     chatTile("Name 1", "message 1"),
      //     chatTile("Name 2", "message 2"),
      //     chatTile("Name 3", "message 3"),
      //   ],
      // ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("You Clicked Here");
          
          showDialog(
            context: context, 
            builder: (context){
              return AlertDialog(
                icon: Icon(Icons.warning, color: Colors.yellow,),
                title: Text("Warning",
                style: TextStyle(
                  fontFamily: "CairoLight"
                ),),
                content: Text("Content"),
                actions: [
                  Text("OK"),
                  Text("Cancel"),
                ],
              );
            });
        },
        backgroundColor: Colors.green,
        child: Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}

Widget chatTile(
  String name, 
  String chatMsg,
  String imgUrl
  ) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListTile(
      title: Text(name),
      subtitle: Text(chatMsg),
      leading: CircleAvatar(
        backgroundImage: AssetImage(imgUrl) ,
      ),
      trailing: Text("12:55"), //DateTime.now().toString()
      tileColor: const Color.fromARGB(255, 157, 188, 157),
    ),
  );
}
