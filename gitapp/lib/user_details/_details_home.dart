import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/user_details/user_details.dart';
import 'package:gitapp/constants/constants.dart';

class DetailScreen extends StatelessWidget {

  DetailScreen({required this.user});
  final String user;

  @override
  Widget build(BuildContext context) {

    DetailsMock mock = new DetailsMock();

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
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Column(
                  children: <Widget> [
                    Container(
                      height: 130.0,
                      width: 130.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 3.0, color: yyellow),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: NetworkImage(mock.getDetails(user).avatarUrl),
                        ),
                      ),
                    ),
                    SizedBox(height: 15.0),
                    Text(
                      mock.getDetails(user).username,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget> [
                Container(
                  child: Column(
                    children: <Widget> [
                      SizedBox(height: 20.0),
                      Container(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          'INFO',
                          style: TextStyle(
                            fontSize: 20.0,
                            color: yyellow,
                            letterSpacing: 1.5,
                          ),
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.0),
                          border: Border.all(width: 1.0, color: yyellow),
                        ),
                      ),
                      SizedBox(height: 15.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text(
                                'Followers',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                mock.getDetails(user).followers,
                                style: TextStyle(
                                  fontSize: 11.0,
                                  letterSpacing: 1.0,
                                  color: yyellow,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            children: [
                              Text(
                                'Repositories',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                mock.getDetails(user).repositoriesCount,
                                style: TextStyle(
                                  fontSize: 11.0,
                                  letterSpacing: 1.0,
                                  color: yyellow,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 10.0),
                          Column(
                            children: [
                              Text(
                                'Country',
                                style: TextStyle(
                                  fontSize: 13.0,
                                  letterSpacing: 2.0,
                                ),
                              ),
                              SizedBox(height: 5.0),
                              Text(
                                mock.getDetails(user).country,
                                style: TextStyle(
                                  fontSize: 11.0,
                                  letterSpacing: 1.0,
                                  color: yyellow,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 45.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget> [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget> [
                    Container(
                      padding: EdgeInsets.all(4.0),
                      child: Text(
                        'REPOSITORIES',
                        style: TextStyle(
                          fontSize: 20.0,
                          color: yyellow,
                          letterSpacing: 1.5,
                        ),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.0),
                        border: Border.all(width: 1.0, color: yyellow),
                      ),
                    ),
                    SizedBox(height: 35.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding:  EdgeInsets.all(10.0),
                          height: 60.0,
                          width: 300.0,
                          decoration: BoxDecoration(
                            color: wwhite,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Text(
                              'https://github.com/user4/FlutterApp',
                              style: TextStyle(
                                fontSize: 14.0,
                                letterSpacing: 2.0,
                                color: bblack,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 10.0),
                        Container(
                          padding:  EdgeInsets.all(10.0),
                          height: 60.0,
                          width: 300.0,
                          decoration: BoxDecoration(
                            color: wwhite,
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: Center(
                            child: Text(
                              'https://github.com/user4/SwiftApp',
                              style: TextStyle(
                                fontSize: 14.0,
                                letterSpacing: 2.0,
                                color: bblack,
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