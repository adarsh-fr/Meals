import 'package:enough_platform_widgets/enough_platform_widgets.dart';
import 'package:flutter/material.dart';

import 'package:meals/data/dummy_data.dart';
import 'package:meals/models/category_model.dart';
import 'package:meals/screens/meals.dart';
import 'package:meals/widgets/category_grid_item.dart';

class CategoriesScreen extends StatelessWidget {
  const CategoriesScreen({super.key});

  void _selectedCategory(BuildContext context, CategoryModel category) {
    final selectedCategoryMeals = dummyMealData
        .where(
          (meal) => meal.categories.contains(category.id),
        )
        .toList();
    
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: selectedCategoryMeals,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      appBar: AppBar(
        //backgroundColor: CupertinoDynamicColor.withBrightness(
            //color: Colors.orangeAccent, darkColor: Colors.blueGrey),
        title: const Text('CuisineCategories'),
      ),
      body: GridView(
        padding: const EdgeInsets.all(20),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 3/2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              onSelectCategory: () {
                _selectedCategory(context,category);
              },
            ),
        ],
      ),
    );
  }
}
