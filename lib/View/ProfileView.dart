import 'package:flutter/material.dart';

class Profileview extends StatefulWidget {
  const Profileview({super.key});

  @override
  State<Profileview> createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('4', style: TextStyle(
        fontSize: 40
    ),),);
  }
}
