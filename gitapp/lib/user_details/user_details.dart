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
      body: Container(
        padding: EdgeInsets.all(30.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              Container(

                height: 150.0,
                width: 150.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 3.0, color: Colors.white),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage('https://i.kym-cdn.com/entries/icons/original/000/035/310/Peepo_Animation_Banner.jpg'),
                  ),
                ),
              ),
              // Center(
              //   child: CircleAvatar(
              //     backgroundImage: NetworkImage('https://i.kym-cdn.com/entries/icons/original/000/035/310/Peepo_Animation_Banner.jpg'),
              //     radius: 60.0,
              //   ),
              // ),
              SizedBox(width: 50.0),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Text(
                      'Username',
                      style: TextStyle(
                        letterSpacing: 2.0,
                      )
                  ),
                  SizedBox(height: 20.0),
                  Text(
                      'Followers',
                      style: TextStyle(
                        letterSpacing: 2.0,
                      )
                  ),
                  SizedBox(height: 20.0),
                  Text(
                      'Repositories',
                      style: TextStyle(
                        letterSpacing: 2.0,
                      )
                  ),
                  SizedBox(height: 20.0),
                  Text(
                      'Country of origin',
                      style: TextStyle(
                        letterSpacing: 2.0,
                      )
                  ),
                  SizedBox(height: 20.0),
                  Text(
                      'List of repos',
                      style: TextStyle(
                        letterSpacing: 2.0,
                      )
                  )
                ],
              ),
            ]
        ),
      ),
    );
  }
}