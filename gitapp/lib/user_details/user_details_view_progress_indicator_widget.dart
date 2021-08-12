import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserDetailsViewProgressIndicator extends StatelessWidget {
  const UserDetailsViewProgressIndicator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(child: CircularProgressIndicator()));
  }
}