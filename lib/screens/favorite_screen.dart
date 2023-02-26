import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_foods/components/food_item.dart';
import 'package:flutter_foods/models/food.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Food> favoriteFoods;
  const FavoriteScreen({required this.favoriteFoods, super.key});

  @override
  Widget build(BuildContext context) {
    if (favoriteFoods.isEmpty) {
      return Center(
        child: Text('Nenhuma refeição foi marcada como favorita!'),
      );
    } else {
      return ListView.builder(
        itemCount: favoriteFoods.length,
        itemBuilder: (context, index) {
          return FoodItem(
            food: favoriteFoods[index],
          );
        },
      );
    }
  }
}
