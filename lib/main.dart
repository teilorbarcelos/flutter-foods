import 'package:flutter/material.dart';
import 'package:flutter_foods/screens/categories_foods_screen.dart';
import 'package:flutter_foods/screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Foods',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        colorScheme: const ColorScheme.light(secondary: Colors.amber),
        fontFamily: 'Raleway',
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        textTheme: ThemeData.light().textTheme.copyWith(
              titleMedium: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
              ),
            ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.pink,
        ),
      ),
      home: CategoriesScreen(),
      routes: {
        '/food-categories': ((context) => CategoriesFoodsScreen())
      },
    );
  }
}
