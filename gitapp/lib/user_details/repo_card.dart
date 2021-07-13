import 'package:flutter/material.dart';
import 'package:gitapp/constants/constants.dart';

class RepoCard extends StatelessWidget {

  RepoCard({required this.repo, required this.animationController});
  final String repo;
  final AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    return SizeTransition(
        sizeFactor: CurvedAnimation(
          parent: animationController,
          curve: Curves.linear,
        ),
        axisAlignment: 0.0,
        child: Container(
          padding:  EdgeInsets.all(10.0),
          height: 60.0,
          width: 300.0,
          decoration: BoxDecoration(
            color: wwhite,
            borderRadius: BorderRadius.circular(5.0),
          ),
          child: Center(
            child: Text(
              repo,
              style: TextStyle(
                fontSize: 14.0,
                letterSpacing: 2.0,
                color: bblack,
              ),
            ),
          ),
        ),
    );
  }
}