import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_foods/screens/categories_screen.dart';
import 'package:flutter_foods/screens/favorite_screen.dart';

class TabsScreen extends StatelessWidget {
  const TabsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Vamos Cozinhar?'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: 'Categorias',
              ),
              Tab(
                icon: Icon(Icons.star),
                text: 'Favoritos',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoriteScreen(),
          ],
        ),
      ),
    );
  }
}
