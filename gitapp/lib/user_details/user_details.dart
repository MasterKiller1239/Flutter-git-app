import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {

  DetailScreen({required this.user, required this.image});
  final String user;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User details"),
      ),
      body: Container(
        padding: EdgeInsets.all(30.0),
        child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget> [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget> [
                  Column(
                    children: <Widget> [
                      Container(
                        height: 150.0,
                        width: 150.0,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(width: 3.0, color: Colors.yellowAccent),
                          image: DecorationImage(
                            fit: BoxFit.fill,
                            image: NetworkImage(image),
                            ),
                          ),
                        ),
                      SizedBox(height: 15.0),
                      Text(
                        user,
                        style: TextStyle(
                          fontSize: 24.0,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 35.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Column(
                    children: <Widget> [
                      Container(
                        child: Text(
                          'INFO',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.yellowAccent,
                            letterSpacing: 1.5,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(width: 3.0, color: Colors.yellowAccent),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Column(
                        children: [
                          Text(
                            'Followers',
                            style: TextStyle(
                              fontSize: 16.0,
                              letterSpacing: 2.0,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '89',
                            style: TextStyle(
                              fontSize: 14.0,
                              letterSpacing: 1.0,
                              color: Colors.yellow,
                            ),
                          ),
                          SizedBox(height: 12.5),
                          Text(
                            'Repositories',
                            style: TextStyle(
                              fontSize: 16.0,
                              letterSpacing: 2.0,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            '3',
                            style: TextStyle(
                              fontSize: 14.0,
                              letterSpacing: 1.0,
                              color: Colors.yellow,
                            ),
                          ),
                          SizedBox(height: 12.5),
                          Text(
                            'Country',
                            style: TextStyle(
                              fontSize: 16.0,
                              letterSpacing: 2.0,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            'Poland',
                            style: TextStyle(
                              fontSize: 14.0,
                              letterSpacing: 1.0,
                              color: Colors.yellow,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: 50.0),
                  Column(
                    children: <Widget> [
                      Container(
                        child: Text(
                          'REPOSITORIES',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.yellowAccent,
                            letterSpacing: 1.5,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(width: 3.0, color: Colors.yellowAccent),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 30.0,
                            width: 140.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Text(
                                'FlutterApp',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  letterSpacing: 2.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            height: 30.0,
                            width: 140.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Text(
                                'SwiftApp',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  letterSpacing: 2.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10.0),
                          Container(
                            height: 30.0,
                            width: 140.0,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Center(
                              child: Text(
                                'C#Programm',
                                style: TextStyle(
                                  fontSize: 14.0,
                                  letterSpacing: 2.0,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
        ),
      ),
    );
  }
}