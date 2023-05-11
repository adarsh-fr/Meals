import 'package:bulleted_list/bulleted_list.dart';
import 'package:flutter/material.dart';
import 'package:meals/models/meal_model.dart';

class MealDetailsScreen extends StatelessWidget {
  const MealDetailsScreen(
      {super.key, required this.meal, required this.onToggleFavorite});

  final MealModel meal;
  final void Function(MealModel meal) onToggleFavorite;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        actions: [
          IconButton(
            onPressed: () {
              onToggleFavorite(meal);
            },
            icon: const Icon(Icons.star_outline),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network(
              meal.imageUrl,
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Ingredients',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            BulletedList(
              listItems: meal.ingredients,
              bulletType: BulletType.conventional,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18,
                  ),
              bulletColor: Theme.of(context).colorScheme.onBackground,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
            const SizedBox(
              height: 14,
            ),
            Text(
              'Steps',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                  ),
            ),
            const SizedBox(
              height: 14,
            ),
            BulletedList(
              listItems: meal.steps,
              bulletType: BulletType.conventional,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.onBackground,
                    fontSize: 18,
                  ),
              bulletColor: Theme.of(context).colorScheme.onBackground,
              crossAxisAlignment: CrossAxisAlignment.start,
            ),
          ],
        ),
      ),
    );
  }
}
