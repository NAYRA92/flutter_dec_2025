import 'package:flutter/material.dart';
import 'package:flutter_application_2912/project_files/home_screen.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _mobile = TextEditingController();
  TextEditingController _password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Container(
          // decoration: BoxDecoration(
          //   image: DecorationImage(
          //     image: AssetImage('images/kids.jpg'),
          //     opacity: 0.3,
          //     fit: BoxFit.cover
          //   )
          // ),
          child: Column(
            children: [
              Image.asset('images/logo.png', height: 100,),
              TextFormField(
                controller: _mobile,
              ),
              TextFormField(
                controller: _password,
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(builder: (context)
                  => HomeScreen(
                    username: "Nayra",
                  )));
                }, 
                child: Text("Log In")),
              SizedBox(height: 20,),
              TextButton(
                onPressed: (){}, 
                child: Text("Countinue as a Guest")),
              TextButton(
                onPressed: (){}, 
                child: Text("Don't Have an Account, Register.")),
            ]
            
          ),
        ),
      ),
    );
  }
}