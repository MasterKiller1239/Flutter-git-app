import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gitapp/user_details/home.dart';

class DetailScreen extends StatelessWidget {

  DetailScreen({required this.user});
  final String user;

  @override
  Widget build(BuildContext context) {
    return Home(user: user);
  }
}