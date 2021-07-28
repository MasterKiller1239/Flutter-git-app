import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';

class emptyListView extends StatelessWidget {


  emptyListView();

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Icon(
              Icons.clear,
              color: primaryDark,
              size: 50.0,
            ),
            Text(
              'No records found',
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
