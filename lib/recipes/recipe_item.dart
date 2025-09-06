import 'package:flutter/material.dart';
import 'package:tapptitude/provider.dart';
import 'package:tapptitude/recipe_screen.dart';
import 'package:tapptitude/recipes/recipe.dart';
import 'package:tapptitude/recipes/recipes_notifier.dart';
import 'package:tapptitude/recipes/toggle_favorite_button.dart';

class RecipeItem extends StatelessWidget {
  final Recipe recipe;

  const RecipeItem({super.key, required this.recipe});

  _handleRecipeNavigation(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return RecipeScreen(recipe: recipe);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final recipesNotifier = Provider.of<RecipesNotifier>(context);

    return Card(
      child: InkWell(
        onTap: () => _handleRecipeNavigation(context),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(4),
              child: Container(
                width: 100,
                height: 100,
                color: Colors.grey[300],
                child: Icon(Icons.fastfood, size: 50, color: Colors.grey[600]),
              ),
            ),

            SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    recipe.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(recipe.duration),
                ],
              ),
            ),

            ToggleFavoriteButton(recipe: recipe),
          ],
        ),
      ),
    );
  }
}
