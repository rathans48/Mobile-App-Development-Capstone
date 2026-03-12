import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'detail.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List data = [];

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  // API Integration Logic
  fetchData() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      setState(() { data = json.decode(response.body); });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset('assets/logo.png', height: 40, errorBuilder: (context, error, stackTrace) => Text("App Logo")), 
        actions: [
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.pushNamed(context, '/settings'),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(data[index]['name']),
            trailing: Icon(Icons.arrow_forward_ios), 
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => DetailScreen(user: data[index])
              ));
            },
          );
        },
      ),
    );
  }
}