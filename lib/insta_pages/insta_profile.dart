
import 'package:flutter/material.dart';
import 'package:flutter_application_2912/app_theme.dart';

class InstaProfile extends StatefulWidget {
  const InstaProfile({super.key});

  @override
  State<InstaProfile> createState() => _InstaProfileState();
}

class _InstaProfileState extends State<InstaProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        leading: Icon(
          Icons.add
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: kPrimaryColor,
                  backgroundImage: AssetImage('images/camera.jpg'),
                  radius: 40,
                ),
        
                Expanded(child: statsWidget("15", 'Posts')),
                Expanded(child: statsWidget("1005", 'Followers')),
                Expanded(child: statsWidget("700", 'Following')),
              ],
            ),

            SizedBox(height: 10,),

            Text("NAYRA HASHEM 💙",
             style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                )),
            Text("Software Engineer"),

            SizedBox(
              height: 10,
            ),

            Row(
              children: [
                Expanded(
                  child: profileButton(
                    Text("Edit Profile")
                  ),
                ),
                SizedBox(width: 5,),
                profileButton(
                  Icon(Icons.person_add)
                ),
              ],
            ),

            // Follow Firends
            SizedBox(
              height: 170,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.all(5),
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15)
                    ),
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.amber,
                          radius: 40,
                        ),
                        Text("User Name"),
                        profileButton(
                          Text("Follow")
                        )
                      ],
                    ),
                  );
                },
              
              ),
            )
          ],
        ),
      ),

    );
  }

  TextButton profileButton(
    Widget _widget
  ) {
    return TextButton(
                  style: TextButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.grey
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  onPressed: (){}, 
                  child: _widget);
  }

  Column statsWidget(
    final String number,
    final String title
  ) {
    return Column(
              children: [
                Text(number,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),),
                Text(title)
              ],
            );
  }
}