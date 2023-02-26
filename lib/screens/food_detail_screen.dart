import 'package:flutter/material.dart';
import 'package:flutter_foods/models/food.dart';

class FoodDetailScreen extends StatelessWidget {
  final Function(Food) onFavorite;
  final Function(Food) isFavorite;
  const FoodDetailScreen({
    required this.onFavorite,
    required this.isFavorite,
    super.key,
  });

  Widget _createSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(
        vertical: 10,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _createSectionContainer(Widget child) {
    return Container(
        width: 340,
        height: 200,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(10)),
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    final food = ModalRoute.of(context)!.settings.arguments as Food;
    return Scaffold(
      appBar: AppBar(
        title: Text(food.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                food.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            _createSectionTitle(
              context,
              'Ingredientes',
            ),
            _createSectionContainer(
              ListView.builder(
                itemCount: food.ingredients.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(food.ingredients[index]),
                    ),
                    color: Theme.of(context).colorScheme.secondary,
                  );
                },
              ),
            ),
            _createSectionTitle(
              context,
              'Passos',
            ),
            _createSectionContainer(ListView.builder(
              itemCount: food.steps.length,
              itemBuilder: ((context, index) {
                return Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                      ),
                      title: Text(food.steps[index]),
                    ),
                    Divider(),
                  ],
                );
              }),
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(isFavorite(food) ? Icons.star : Icons.star_border),
        onPressed: () => onFavorite(food),
      ),
    );
  }
}
