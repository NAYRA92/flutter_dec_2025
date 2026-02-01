import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class GetApiData extends StatefulWidget {
  const GetApiData({super.key});

  @override
  State<GetApiData> createState() => _GetApiDataState();
}

class _GetApiDataState extends State<GetApiData> {
  String dataUrl = "https://jsonplaceholder.typicode.com/users";

  Future<void> getData() async{
    final response = await http.get(Uri.parse(dataUrl));
    print(response.body);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}