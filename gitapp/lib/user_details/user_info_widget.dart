import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';

class UserInfoWidget extends StatelessWidget {

  final int followersCount;
  final int repositoriesCount;
  final String country;

  UserInfoWidget({required this.followersCount, required this.repositoriesCount, required this.country});

  @override
  Widget build(BuildContext context) {
    return Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              Container(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  'INFO',
                  style: TextStyle(fontSize: 20.0, color: yyellow, letterSpacing: 1.5),
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
                        style: TextStyle(fontSize: 13.0, letterSpacing: 2.0),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        followersCount.toString(),
                        style: TextStyle(fontSize: 11.0, letterSpacing: 1.0, color: yyellow),
                      ),
                    ],
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    children: [
                      Text(
                        'Repositories',
                        style: TextStyle(fontSize: 13.0, letterSpacing: 2.0),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        repositoriesCount.toString(),
                        style: TextStyle(fontSize: 11.0, letterSpacing: 1.0, color: yyellow),
                      ),
                    ],
                  ),
                  SizedBox(width: 10.0),
                  Column(
                    children: [
                      Text(
                        'Country',
                        style: TextStyle(fontSize: 13.0, letterSpacing: 2.0),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        country,
                        style: TextStyle(fontSize: 11.0, letterSpacing: 1.0, color: yyellow),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ]
    );
  }
}