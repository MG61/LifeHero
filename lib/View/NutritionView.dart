import 'package:flutter/material.dart';

class Nutritionview extends StatefulWidget {
  const Nutritionview({super.key});

  @override
  State<Nutritionview> createState() => _NutritionviewState();
}

class _NutritionviewState extends State<Nutritionview> {
  @override
  Widget build(BuildContext context) {
    return Container(child: Text('3', style: TextStyle(
        fontSize: 40
    ),),);
  }
}
