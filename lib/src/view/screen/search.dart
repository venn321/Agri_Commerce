import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<String> itemList = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  List<String> filteredItemList = [];

  @override
  void initState() {
    filteredItemList = itemList;
    super.initState();
  }

  void filterItems(String query) {
    setState(() {
      filteredItemList = itemList
          .where((item) => item.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) {
                filterItems(value);
              },
              decoration: InputDecoration(
                labelText: 'Search',
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredItemList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredItemList[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: SearchScreen(),
  ));
}
