import 'package:flutter/material.dart';
import 'dummy-data.dart';
import 'categoryItem.dart';

class CategoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: EdgeInsets.all(25.0),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
              color: catData.color,
              title: catData.title,
              id: catData.id,
            ),
          )
          .toList(),
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        maxCrossAxisExtent: 200,
      ),
    );
  }
}
