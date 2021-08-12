import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/constants/no_network_widget.dart';
import 'package:gitapp/user_details/user_details_repository.dart';
import 'package:gitapp/constants/progress_indicator_widget.dart';
import 'package:gitapp/user_details/user_details_view_snapshot_has_data_widget.dart';
import 'package:gitapp/user_details/user_repo_model.dart';
import 'package:gitapp/user_details/user_details_model.dart';
import 'package:gitapp/user_details/user_details_presenter.dart';
import 'package:gitapp/users_list/connection_presenter.dart';

Future<List<UserRepo>> repositoriesList(int userId) async =>
    await UserDetailsPresenter.userDetailsPresenter.getRepositoriesList(userId);
Future<UserDetails> userDetails(int userId) async =>
    await UserDetailsRepository.userDetailsRepository.fetchUserDetails(userId);
bool connectionStatus = true;
Future<bool> checkConnection() async =>
    connectionStatus = await Connection.instance.checkConnection();

class DetailScreen extends StatefulWidget {
  DetailScreen({required this.userId});
  final int userId;

  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  void initState() {
    super.initState();
    checkConnection();
    userDetails(widget.userId);
    repositoriesList(widget.userId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User details"),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: Future.wait(
              [checkConnection(), userDetails(widget.userId), repositoriesList(widget.userId)]),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            if (connectionStatus == false) {
              return NoNetworkWidget();
            }
            else if (snapshot.hasData) {
              return UserDetailsViewSnapshotHasData(
                  widget: widget, snapshot: snapshot);
            } else if (snapshot.hasError) {
              return Container(
                  height: 120.0,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 40.0),
                        Center(child: Text('Failed to fetch data from API.')),
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