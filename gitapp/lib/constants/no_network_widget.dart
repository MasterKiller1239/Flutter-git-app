import 'package:flutter/cupertino.dart';
import 'package:gitapp/users_list/no_connection_widget.dart';

class NoNetworkWidget extends StatelessWidget {
  const NoNetworkWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: NetworkErrorView(
          message: 'No Internet Connection.\nMind Trying again?'),
    );
  }
}
