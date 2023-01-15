import 'package:flutter/material.dart';
import 'package:flutter_foods/models/category.dart';

class CategoriesFoodsScreen extends StatelessWidget {
  const CategoriesFoodsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments;

    _getCategory() {
      return Future.delayed(Duration(seconds: 0), () => category);
    }

    return FutureBuilder(
      future: _getCategory(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            appBar: AppBar(
              title: Text(snapshot.data.title),
            ),
            body: Center(
              child: Text('Receitas por Categoria ${snapshot.data.id}'),
            ),
          );
        } else {
          return Scaffold(
            appBar: AppBar(
              title: Text("Loading"),
            ),
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
