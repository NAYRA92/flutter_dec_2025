import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_2912/homepage.dart';
import 'package:flutter_application_2912/instagram_home_page.dart';

import 'app_theme.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController _mobileController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  bool _isChecked = false;
  bool _isVisible = true;


String name = "";
String password = "";

bool exist = false;

  
  Future<bool> checkExist(String _mobile) async {
    try {
      await FirebaseFirestore.instance.doc("students/$_mobile").get().then((doc) {
        if (doc.exists) {
          //if document exist, check user password
          //here I made the document ID as user mobile number

          Map<String, dynamic> data = doc.data()!;
          // You can then retrieve the value from the Map like this:
          
          password = data['password']; //Database Password

          if (password == _passwordController.text) {
           //
            exist = true;
            //if entered password is correct, go to next screen
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => InstagramHomePage(),));
          }

        //if entered value is not equal to document password
        else if (password != _passwordController.text) {
            print("Worng Data.");
          }
        }
        
        //if document not exists
        else if (!doc.exists) {
          exist = false;
          setState(() {
          print("Check Your Data.");
        });
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      });
      return exist;
    } catch (e) {
      // If any error
      print(e);
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Log In"), centerTitle: true),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Mobile"),
              //User Email Field
              TextFormField(
                controller: _mobileController,
                decoration: InputDecoration(
                  hintText: "Enter Your Mobile",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),

              SizedBox(height: 15),

              //Password Field
              Text("Password"),
              TextFormField(
                controller: _passwordController,
                obscureText: _isVisible,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  hintText: "Enter Your Password",
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        _isVisible ? 
                        _isVisible = false : 
                        _isVisible = true;
                      });
                    }, 
                    icon: Icon(
                    _isVisible ? 
                    Icons.visibility_off
                    : Icons.visibility
                     
                      )),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                ),
              ),

              //CheckBox and Forget Password Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //CheckBox
                  // CheckboxListTile(
                  //   value: true,
                  //   onChanged: (value){},
                  //   title: Text("Remember Me"),
                  //   controlAffinity: ListTileControlAffinity.leading,
                  //   ),

                  //With Row
                  Row(
                    children: [
                      Checkbox(
                        value: _isChecked,
                        onChanged: (value) {
                          setState(() {
                            _isChecked = value!;
                          });
                        },
                        fillColor: WidgetStatePropertyAll(kPrimaryColor),
                      ),
                      Text("Remember Me"),
                    ],
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Forgot Your Password?"),
                  ),
                ],
              ),

              SizedBox(height: 25),
              SizedBox(
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    //Check User Exist Function
                    checkExist(_mobileController.text);
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
              ),

              //Sign Up Button
              SizedBox(height: 25),
              TextButton(
                onPressed: () {
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => HomePage())
                  );
                },
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 18,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
