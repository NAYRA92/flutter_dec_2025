import 'package:flutter/material.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({super.key});

  @override
  State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text("Here")),

            //drawer body
            drawerItems("My Files", Icons.folder, () {}),
            drawerItems("Shared With Me", Icons.share, () {}),
            drawerItems("Starred", Icons.star, () {}),
          ],
        ),
      ),
    );
  }

  ListTile drawerItems(
  String title, 
  IconData icn, 
  Function() fn) {
    return ListTile(
      leading: Icon(icn),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: fn,
    );
  }
}
