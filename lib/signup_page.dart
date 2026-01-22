import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _mobile = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold
    (
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextFormField(
              controller: _name,
            ),
            TextFormField(
              controller: _mobile,
            ),

            ElevatedButton(
              onPressed: () async {
              //  await FirebaseFirestore
              //  .instance
              //  .collection("students")
              //  .doc(_mobile.text)
              //  .set({
              //   'name': _name.text,
              //   'mobile': _mobile.text
              //  });

              // await FirebaseFirestore
              //   .instance
              //   .collection("users")
              //   .add({
              //     'name': _name.text,
              //     'mobile': _mobile.text,
              //   });

               await FirebaseFirestore
               .instance
               .collection("students")
               .doc(_mobile.text)
               .update({
                'name': _name.text,
                'mobile': _mobile.text
               });
               
              _name.clear();
              _mobile.clear();
              }, 
              child: Text("Sign Up"))
          ],
        ),
      ),
    );
  }
}