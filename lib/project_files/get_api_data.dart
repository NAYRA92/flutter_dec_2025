import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_2912/project_files/constants/app_theme.dart';
import 'package:http/http.dart' as http;


class GetApiData extends StatefulWidget {
  const GetApiData({super.key});

  @override
  State<GetApiData> createState() => _GetApiDataState();
}

class _GetApiDataState extends State<GetApiData> {
  // String dataUrl = "https://jsonplaceholder.typicode.com/users";
  String dataUrl = "https://picsum.photos/v2/list";

  List<dynamic> users = [];

  Future<void> getData() async{
    final response = await http.get(Uri.parse(dataUrl));
    final get_data = jsonDecode(response.body);
    for(var index in get_data){
      users.add(index);
    }
    setState(() {
      
    });
    print(users[5]['name']);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index){
          return Padding(
            padding: const EdgeInsets.all(5.0),
            child: ListTile(
              tileColor: Colors.amber[100],
              title: Text(users[index]["author"]),
              trailing: CircleAvatar(
                backgroundImage: NetworkImage(
                  users[index]["download_url"]),
              ),
            ),
          );
        }),
    );
  }
}