import 'package:flutter/material.dart';
import 'package:flutter_foods/models/food.dart';

class FoodItem extends StatelessWidget {
  final Food food;
  const FoodItem({
    required this.food,
    super.key,
  });

  void _selectFood() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: _selectFood,
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.network(
                    food.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
