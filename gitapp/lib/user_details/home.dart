import 'package:flutter/material.dart';
import 'package:gitapp/user_details/user_details.dart';
import 'package:gitapp/constants/constants.dart';
import 'package:gitapp/user_details/repo_card.dart';

class Home extends StatefulWidget {
  Home({Key? key, required this.user}) : super(key: key);
  final String user;

  @override
  _HomeState createState() => _HomeState(user: user);
}

class _HomeState extends State<Home> with TickerProviderStateMixin {

  _HomeState({required this.user});
  final String user;

  DetailsMock mock = DetailsMock();
  final List<RepoCard> _card = <RepoCard>[];

  void _prepareRepoCards() {
    mock.reposList.forEach((element) {
      RepoCard repoCard = RepoCard(
          repo: element,
          animationController: AnimationController(
            duration: Duration(milliseconds: 700),
            vsync: this,
          ),
      );
      _card.add(repoCard);
    });
  }

  @override
  void initState() {
    _prepareRepoCards();
    super.initState();
  }

  void dispose() {
    for (RepoCard message in _card)
      message.animationController.dispose();
    super.dispose();
  }

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
                          height: 150.0,
                          width: 150.0,
                          child: ListView.builder(
                            padding: EdgeInsets.all(8.0),
                            itemBuilder: (context, index) => _card[index],
                            itemCount: _card.length,
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