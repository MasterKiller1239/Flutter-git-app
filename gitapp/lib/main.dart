import 'package:flutter/material.dart';
import 'package:gitapp/user_details/user_details.dart';
import 'package:gitapp/users_list/User_card.dart';
import 'package:gitapp/users_list/user.dart';
import 'package:gitapp/users_list/users_list.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gitapp',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF2D239F),
        scaffoldBackgroundColor: Color(0xFF313EBB),

        brightness: Brightness.dark
      ),
      home: MyHomePage(title: 'Gitapp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  //FGA-3
  final List<UserCard> _card = <UserCard>[];
  final UsersList users = new UsersList();
  String name = "";
  final TextEditingController _textController = new TextEditingController();
  bool searching =  false;

  Future _getUsers(String text) async {

    _card.clear();
    setState(() {
      searching = true;
    });
   if(text!="")
     {
       name= text;
       _textController.clear();
       users.GetSearchedUsers(text);
       if(users.searchedlist !=null)
       {

         for (User user in users.searchedlist)
         {
           UserCard card = new UserCard(
             user:user.username,
             image: user.avatarUrl,


             animationController: new AnimationController(
               duration: new Duration(milliseconds: 700),
               vsync: this,
             ),
           );

           setState(() {
             _card.insert(0, card);
           });
           card.animationController.forward();
         }
       }
     }
  }
  void dispose() {
    for (UserCard message in _card)
      message.animationController.dispose();
    super.dispose();
  }
    Widget _buildTextComposer() {
      return new IconTheme(
          data: new IconThemeData(color: Theme.of(context).accentColor),
          child: new Container(
            margin: const EdgeInsets.symmetric(horizontal: 8.0),
            child: new Row(children: <Widget>[
              //FGA-4
              new Flexible(
                child: new TextField(
                  controller: _textController,
                  onSubmitted: _getUsers,
                  cursorColor: Colors.blueGrey,
                  decoration:
                  new InputDecoration.collapsed(hintText: "Enter Github Username"),
                ),
              ),
              new Container(
                  margin: new EdgeInsets.symmetric(horizontal: 4.0),
                  child: new IconButton(
                      icon: new Icon(Icons.search),
                      onPressed: () => _getUsers(_textController.text)
                  )
              ),
            ]),
          )
      );
    }


  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
        body: new Container(
          child: new Column(
              children: <Widget>[
                new Container(
                  decoration: new BoxDecoration(
                      color: Theme.of(context).cardColor),
                  child: _buildTextComposer(),
                ),
                new Divider(height: 2.0),
                new Flexible(
                    child: new ListView.builder(
                      padding: new EdgeInsets.all(8.0),
                      itemBuilder: (_, int index) => _card[index],
                      itemCount: _card.length,
                    )
                ),
              ]
          ),
        ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(),
            ),
          );
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
