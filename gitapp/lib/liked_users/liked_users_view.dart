import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/no_network_widget.dart';
import 'package:gitapp/liked_users/liked_users_list_widget.dart';
import 'package:gitapp/users_list/connection_presenter.dart';
import 'liked_users_model.dart';
import 'liked_users_presenter.dart';
import 'package:gitapp/constants/progress_indicator_widget.dart';

Future<List<LikedUser>> likedUsersList() async =>
    await LikedUsersPresenter.likedUsersPresenter.getLikedUsersList();
bool connectionStatus = true;
Future<bool> checkConnection() async =>
    connectionStatus = await Connection.instance.checkConnection();

class LikedUsersWidget extends StatefulWidget {
  @override
  _LikedUsersWidgetState createState() => _LikedUsersWidgetState();
}

class _LikedUsersWidgetState extends State<LikedUsersWidget> {
  @override
  void initState() {
    super.initState();
    checkConnection();
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
          future: Future.wait([checkConnection(), likedUsersList()]),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (connectionStatus == false) {
              return NoNetworkWidget();
            } else if (snapshot.hasData) {
              return Column(children: [
                SizedBox(height: 20.0),
                Center(
                    child:
                        LikedUsersListWidget(listLikedUsers: snapshot.data[1]))
              ]);
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
              return ProgressIndicatorWidget();
            }
          },
        ),
      ),
    );
  }
}
