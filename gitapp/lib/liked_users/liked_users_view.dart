import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/liked_users/liked_users_list_widget.dart';
import 'liked_users_model.dart';
import 'liked_users_presenter.dart';

Future<List<LikedUser>> likedUsersList() async =>
    await LikedUsersPresenter.likedUsersPresenter.getLikedUsersList();

class LikedUsersWidget extends StatefulWidget {
  @override
  _LikedUsersWidgetState createState() => _LikedUsersWidgetState();
}

class _LikedUsersWidgetState extends State<LikedUsersWidget> {
  @override
  void initState() {
    super.initState();
    likedUsersList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Liked users"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: likedUsersList(),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (snapshot.hasData) {
              return Column(children: [
                SizedBox(height: 20.0),
                LikedUsersListWidget(
                    //username: snapshot.data[0].username,
                    //avatarUrl: snapshot.data[0].avatarUrl),
                )]);
            } else if (snapshot.hasError) {
              return Container(
                  height: 120.0,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40.0),
                        Center(child: Text('Failed to fetch liked users.')),
                        Center(
                            child: IconButton(
                                icon: Icon(Icons.wifi_protected_setup),
                                onPressed: () => setState(() {})))
                      ]));
            } else {
              return Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child: Center(child: CircularProgressIndicator()));
            }
          },
        ),
      ),
    );
  }
}