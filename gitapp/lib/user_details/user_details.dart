import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  // Declare a field that holds the Todo

  // In the constructor, require a Todo


  @override
  Widget build(BuildContext context) {
    // Use the Todo to create our UI
    return Scaffold(
      appBar: AppBar(
        title: Text("User details"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text("User details screen"),
      ),
    );
  }
}