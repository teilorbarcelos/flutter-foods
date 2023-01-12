import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_foods/models/category.dart';

class CategoryItem extends StatelessWidget {
  final Category category;
  const CategoryItem({required this.category, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(category.title),
    );
  }
}
