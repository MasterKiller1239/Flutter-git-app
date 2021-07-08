import 'package:flutter/material.dart';
import 'package:gitapp/user_details/user_details.dart';
class ProfileCard extends StatelessWidget {
  ProfileCard({required this.user,required this.image,  required this.animationController});


  final String user;
  final String image;

  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
        sizeFactor: new CurvedAnimation(
          parent: animationController,
          curve: Curves.linear,
        ),
        axisAlignment: 0.0,
        child: new Container(
          margin: EdgeInsets.only(bottom: 20.0),
          child: new RaisedButton(
              color: Colors.blueGrey,
              onPressed: (){
                Navigator.push(context, new MaterialPageRoute(builder: (context) =>  DetailScreen()));
              },
              child: new Container(
                padding: EdgeInsets.symmetric(vertical: 12.0),
                margin: const EdgeInsets.only(right: 5.0),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Container(
                      margin: const EdgeInsets.only(right:16.0),
                      child: new Image.network(image,width: 100.0,height: 100.0,),
                    ),
                    new Expanded(
                      child: new Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          new Text(
                              user,
                              style: Theme.of(context).textTheme.title
                          ),
                          new Padding(padding: EdgeInsets.only(bottom: 24.0)),

                        ],
                      ),
                    ),
                  ],
                ),
              )
          ),
        )
    );
  }
}