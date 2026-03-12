import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map user;
  DetailScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Details")),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Name: ${user['name']}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text("Email: ${user['email']}", style: TextStyle(fontSize: 16)),
            Text("Phone: ${user['phone']}", style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}