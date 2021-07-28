import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/homePage/no_connection.dart';
import 'package:gitapp/users_list/user_card_api.dart';
import 'package:gitapp/users_list/users_list.dart';
import 'package:fluttertoast/fluttertoast.dart';
class apiSearchView extends StatefulWidget {


  apiSearchView();

  @override
  apiSearchViewState createState() => apiSearchViewState();
}

class apiSearchViewState extends State<apiSearchView> with TickerProviderStateMixin{
  final TextEditingController _textController = TextEditingController();
  bool connectionStatus = true;
  bool searching = false;
  Future getUsersFromApi(String text) async {
    if (text != "") {
      await UsersList.instance.fetchUsers(text);
      setState(() {
        _textController.clear();
      });

    }
  }
  Future checkConnection() async {
    ConnectivityResult connectivityResult =
    await (Connectivity().checkConnectivity());
    setState(() {
      if (connectivityResult == ConnectivityResult.mobile) {
        connectionStatus = true;
      } else if (connectivityResult == ConnectivityResult.wifi) {
        connectionStatus = true;
      } else
        connectionStatus = false;
    });
  }

  Widget _buildTextComposer() {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(children: <Widget>[
            Flexible(
              child: TextField(
                controller: _textController,
                cursorColor: cursorColor,
                decoration: InputDecoration.collapsed(
                    hintText: "Enter Github Username"),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () => getUsersFromApi(_textController.text))),
          ]),
        ));
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(children: <Widget>[
        Container(
          decoration:
          BoxDecoration(color: Theme.of(context).cardColor),
          child: _buildTextComposer(),
        ),
        Divider(height: 2.0),
        Flexible(
            child: !connectionStatus
                ? Center(
              child: networkErrorView(
                  message:
                  'No Internet Connection.\nMind Trying again?'),
            )
                : searching
                ? Center(
              child: CircularProgressIndicator(),
            )
                : ListView.builder(
              shrinkWrap: true,
              padding: EdgeInsets.all(8.0),
              itemBuilder: (context, int index) => UserCardApi(
                user: UsersList.instance.searchedList[index],
                animationController: AnimationController(
                  duration: new Duration(
                      milliseconds: animationTime),
                  vsync: this,
                ), info: info,
              ),
              itemCount: UsersList.instance.searchedList.length,
            )),
      ]),
    );
  }
  info() => Fluttertoast.showToast(msg: "User Added to Database", gravity: ToastGravity.CENTER,backgroundColor: yyellow);
}
