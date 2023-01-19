import 'package:flutter/material.dart';
import 'package:flutter_foods/models/food.dart';
class FoodDetailScreen extends StatelessWidget {
  const FoodDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final food = ModalRoute.of(context)!.settings.arguments as Food;
    return Scaffold(
      appBar: AppBar(
        title: Text(food.title),
      ),
      body: Center(
        child: Text('Detalhes da Refeição'),
      ),
    );
  }
}
