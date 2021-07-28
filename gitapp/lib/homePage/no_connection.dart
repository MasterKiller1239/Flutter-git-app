import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';

class networkErrorView extends StatelessWidget {
  final String message;

  networkErrorView({required this.message});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.signal_cellular_connected_no_internet_4_bar,
              color: primaryDark,
              size: 50.0,
            ),
            Text(
              message,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 16.0,
                color: secondaryLight,
              ),
            )
          ],
        ),
      ),
    );
  }
}
