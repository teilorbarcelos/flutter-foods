import 'package:flutter/material.dart';
import 'package:flutter_foods/components/food_item.dart';
import 'package:flutter_foods/models/food.dart';
import '../models/category.dart';

class CategoriesFoodsScreen extends StatelessWidget {
  final List<Food> foods;

  const CategoriesFoodsScreen({required this.foods, super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryFoods = foods.where((food) {
      return food.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryFoods.length,
        itemBuilder: (ctx, index) {
          return FoodItem(
            food: categoryFoods[index],
          );
        },
      ),
    );
  }
}
