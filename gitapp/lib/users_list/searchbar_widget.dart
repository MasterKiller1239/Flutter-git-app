import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';

class Searchbar extends StatefulWidget {
  Searchbar(this.getUsers);

  final Function(String) getUsers;
  final TextEditingController textController = new TextEditingController();

  @override
  SearchbarState createState() => SearchbarState();
}

class SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    return IconTheme(
        data: IconThemeData(color: Theme.of(context).accentColor),
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(children: <Widget>[
            Flexible(
              child: TextField(
                controller: widget.textController,
                onSubmitted: widget.getUsers,
                cursorColor: cursorColor,
                decoration: InputDecoration.collapsed(
                    hintText: "Enter Github Username"),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(horizontal: 4.0),
                child: IconButton(
                    icon: Icon(Icons.search),
                    onPressed: () =>
                        widget.getUsers(widget.textController.text))),
          ]),
        ));
  }
}
