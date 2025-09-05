import 'package:flutter/material.dart';
import 'package:tapptitude/recipe_item.dart';

class RecipeFavoritesList extends StatelessWidget {
  final List<String> recipes;

  const RecipeFavoritesList({super.key, required this.recipes});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(height: 8),
      itemCount: recipes.length,
      itemBuilder: (ctx, index) {
        return RecipeItem(name: recipes[index]);
      },
    );
  }
}
