import 'package:flutter/material.dart';
import 'package:flutter_foods/data/dummy_data.dart';
import 'package:flutter_foods/models/food.dart';
import 'package:flutter_foods/models/settings.dart';
import 'package:flutter_foods/screens/categories_foods_screen.dart';
import 'package:flutter_foods/screens/food_detail_screen.dart';
import 'package:flutter_foods/screens/settings_screen.dart';
import 'package:flutter_foods/screens/tabs_screen.dart';
import 'package:flutter_foods/utils/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Settings settings = Settings();
  List<Food> _availableFoods = dummyFoods;
  List<Food> _favoriteFoods = [];

  void _filterFoods(Settings settings) {
    setState(() {
      this.settings = settings;
      _availableFoods = dummyFoods.where((food) {
        final filterGluten = settings.isGlutenFree && !food.isGlutenFree;
        final filterLactose = settings.isLactoseFree && !food.isLactoseFree;
        final filterVegan = settings.isVegan && !food.isVegan;
        final filterVegetarian = settings.isVegetarian && !food.isVegetarian;
        return !filterGluten &&
            !filterLactose &&
            !filterVegan &&
            !filterVegetarian;
      }).toList();
    });
  }

  void _toggleFavorite(Food food) {
    setState(() {
      _favoriteFoods.contains(food)
          ? _favoriteFoods.remove(food)
          : _favoriteFoods.add(food);
    });
  }

  bool _isFavorite(Food food) {
    return _favoriteFoods.contains(food);
  }

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
      initialRoute: '/',
      routes: {
        AppRoutes.HOME: (context) => TabsScreen(
              favoriteFoods: _favoriteFoods,
            ),
        AppRoutes.CATEGORIES_FOODS: (context) => CategoriesFoodsScreen(
              foods: _availableFoods,
            ),
        AppRoutes.FOOD_DETAIL: (context) => FoodDetailScreen(
              onFavorite: _toggleFavorite,
              isFavorite: _isFavorite,
            ),
        AppRoutes.SETTINGS: (context) => SettingsScreen(
              settings: settings,
              onSettingsChanged: _filterFoods,
            ),
      },
    );
  }
}
