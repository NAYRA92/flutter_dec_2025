import 'package:flutter/material.dart';

class InstaHome extends StatefulWidget {
  const InstaHome({super.key});

  @override
  State<InstaHome> createState() => _InstaHomeState();
}

class _InstaHomeState extends State<InstaHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.add),
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
            child: ListView.builder(
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
