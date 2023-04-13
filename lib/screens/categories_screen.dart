import 'package:flutter/material.dart';
import '../widgets/category_item.dart';
import '../data/dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // maximum width of the grid
        childAspectRatio: 3 / 2, // ratio of cross axis to main axis extent
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
      ),
      padding: const EdgeInsets.all(20),
      children: DUMMY_CATEGORIES
          .map(
            (catData) => CategoryItem(
                id: catData.id, title: catData.title, color: catData.color),
          )
          .toList(),
    );
  }
}
