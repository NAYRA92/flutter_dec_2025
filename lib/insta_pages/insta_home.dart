import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class InstaHome extends StatefulWidget {
  const InstaHome({super.key});

  @override
  State<InstaHome> createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  TextEditingController _imageUrl = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _caption = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: (){
            showDialog(
              context: context, 
              builder: (context){
                return Dialog(
                  child: Container(
                    height: 300,
                    width: 300,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _imageUrl,
                        ),
                        TextFormField(
                          controller: _username,
                        ),
                        TextFormField(
                          controller: _caption,
                        ),
                        ElevatedButton(
                          onPressed: () async {
                           await FirebaseFirestore
                            .instance
                            .collection("posts")
                            .add({
                              'imageUrl': _imageUrl.text,
                              'userName': _username.text,
                              'caption': _caption.text,
                            });
                            Navigator.pop(context);
                          }, 
                          child: Text("Add Post"))
                      ],
                    ),
                  ),
                );
              });
          }, 
          icon: Icon(Icons.add)),
        title: Image.asset('images/Instagram_logo.png', height: 40),
        actions: [Icon(Icons.favorite_outline_outlined)],
      ),
      body: Column(
        children: [
          // Stories List View
          SizedBox(
            height: 100,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 25,
              itemBuilder: (context, index) {
                return instaAvaatar(index);
              },
            ),
          ),

          // Content List View
          Expanded(
            child: 
            // StreamBuilder(stream: stream, builder: builder)
            ListView.builder(
              itemCount: 25,
              itemBuilder: (context, index) {
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [Text("UserName"), Icon(Icons.more_vert)],
                        ),
                      ),

                      Container(
                        height: 350,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          image: DecorationImage(
                            image: AssetImage('images/kids.jpg'),
                            fit: BoxFit.cover,
                            alignment: Alignment.center)
                        ),
                      ),

                      // Image.asset('images/kids.jpg'),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(Icons.favorite),
                              Icon(Icons.message),
                              Icon(Icons.send),
                            ],
                          ),

                          Icon(Icons.bookmark),
                        ],
                      ),

                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text("UserName"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Text("Caption"),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget instaAvaatar(int index) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          index == 0
              ? Stack(
                  clipBehavior: Clip.none,
                  children: [
                    CircleAvatar(backgroundColor: Colors.blue, radius: 30),
                    Positioned(
                      bottom: 5,
                      right: 3,
                      child: SizedBox(
                        height: 20,
                        width: 20,
                        child: IconButton(
                          style: IconButton.styleFrom(
                            backgroundColor: Colors.black,
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.add, size: 8, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                )
              : CircleAvatar(backgroundColor: Colors.blue, radius: 30),
          Text(index == 0 ? 'Your Story' : 'User Name'),
        ],
      ),
    );
  }
}
