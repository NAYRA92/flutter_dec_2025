
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class FirebaseCrud extends StatefulWidget {
  const FirebaseCrud({super.key});

  @override
  State<FirebaseCrud> createState() => _FirebaseCrudState();
}

class _FirebaseCrudState extends State<FirebaseCrud> {
  TextEditingController _imageUrl = TextEditingController();
  TextEditingController _username = TextEditingController();
  TextEditingController _caption = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
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
            SizedBox(
              height: 15,
            ),
            ElevatedButton(
              onPressed: () async {
                await FirebaseFirestore
                .instance
                .collection("posts")
                .add({
                  "imgUrl": _imageUrl.text,
                  "username": _username.text,
                  "caption": _caption.text
                });
                _imageUrl.clear();
                _username.clear();
                _caption.clear();

                ScaffoldMessenger.of(context)
                .showSnackBar(
                  SnackBar(content: Text("Data Added Successfully"))
                );
              }, 
              child: Text("Add")),

            //data streaming
            Expanded(
              child: StreamBuilder(
                stream: FirebaseFirestore
                .instance
                .collection("posts")
                .snapshots(), 
                builder: (context, snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }
                  if(!snapshot.hasData){
                    return Text("There is no Data!");
                  }
                  if(snapshot.hasError){
                    return Text("An error occoured, try again.");
                  }

                  final myposts = snapshot.data!.docs;
                  
                  return ListView.builder(
                    itemCount: myposts.length,
                    itemBuilder: (context, index){
                      return Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                onPressed: () async {
                                  await FirebaseFirestore
                                  .instance
                                  .collection("posts")
                                  .doc(myposts[index].id)
                                  .update({
                                    "imgUrl": _imageUrl.text,
                                    "username": _username.text,
                                    "caption": _caption.text
                                  });

                                  _imageUrl.clear();
                                  _username.clear();
                                  _caption.clear();

                                }, icon: Icon(Icons.edit)),
                              
                              IconButton(
                                onPressed: () async {

                                  await FirebaseFirestore
                                  .instance
                                  .collection("posts")
                                  .doc(myposts[index].id)
                                  .delete();


                                }, icon: Icon(Icons.delete_forever))
                            ],
                          ),
                          Image.network(myposts[index]["imgUrl"]),
                          Text(myposts[index]["username"]),
                          Text(myposts[index]["caption"]),
                        ],
                      );

                    });
                })
            )
          ],
        ),
      ),
    );
  }
}