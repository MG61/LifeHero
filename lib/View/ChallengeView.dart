import 'package:flutter/material.dart';

class Challengeview extends StatefulWidget {
  const Challengeview({super.key});

  @override
  State<Challengeview> createState() => _ChallengeviewState();
}

class _ChallengeviewState extends State<Challengeview> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('1', style: TextStyle(
      fontSize: 40
    ),),);
  }
}
