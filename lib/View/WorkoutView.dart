import 'package:flutter/material.dart';


class Workoutview extends StatefulWidget {
  const Workoutview({super.key});

  @override
  State<Workoutview> createState() => _WorkoutviewState();
}

class _WorkoutviewState extends State<Workoutview> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('2', style: TextStyle(
        fontSize: 40
    ),),);
  }
}
