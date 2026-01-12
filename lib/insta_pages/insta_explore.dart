import 'package:flutter/material.dart';

class InstaExplore extends StatefulWidget {
  const InstaExplore({super.key});

  @override
  State<InstaExplore> createState() => _InstaExploreState();
}

class _InstaExploreState extends State<InstaExplore> {
  List<String> items = [
    'Apple', 'Banana', 'Orange',
    'Mango', 'Blueberry', 'Strawberry',
  ];

  List<String> searchedList = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchedList=items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          TextFormField(
            controller: _searchController,
            onChanged: (value) {
             if(value.isEmpty){
              setState(() {
                
                searchedList = items;
              });
             }
             else{
              setState(() {
                searchedList = items.where(
                (item){
                 return item
                  .toLowerCase()
                  .contains(value.toLowerCase());
                }
              ).toList();
              });
              
             }
            },
            decoration: InputDecoration(
              hintText: 'Search tag here',
              labelText: 'Search',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              )
            ),
          ),
          Expanded(
            child: GridView.builder(
              itemCount: searchedList.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4), 
              itemBuilder: (context, index){
                return Center(
                  child: Text(
                    searchedList[index]));
              }),
          )
        ],
      ),
    );
  }
}