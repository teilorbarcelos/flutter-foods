import 'package:flutter/material.dart';
import '../models/category.dart';
import '../data/dummy_data.dart';

class CategoriesFoodsScreen extends StatelessWidget {
  const CategoriesFoodsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)!.settings.arguments as Category;

    final categoryFoods = dummyFoods.where((food) {
      return food.categories.contains(category.id);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
      ),
      body: ListView.builder(
        itemCount: categoryFoods.length,
        itemBuilder: (ctx, index) {
          return Text(categoryFoods[index].title);
        },
      ),
    );
  }
}