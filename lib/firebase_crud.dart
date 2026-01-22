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
            ElevatedButton(
              onPressed: (){}, 
              child: Text("Add"))
          ],
        ),
      ),
    );
  }
}