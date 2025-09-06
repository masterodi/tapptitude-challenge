import 'package:flutter/material.dart';
import 'package:tapptitude/provider.dart';
import 'package:tapptitude/recipes/recipe.dart';
import 'package:tapptitude/recipes/recipes_notifier.dart';

class RecipeScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
    final recipesNotifier = Provider.of<RecipesNotifier>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Recipe')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: 200,
                color: Colors.grey[300],
                child: Icon(Icons.fastfood, size: 100, color: Colors.grey[600]),
              ),

              SizedBox(height: 16),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          recipe.name,
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        Text(
                          'Duration: ${recipe.duration}',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    icon: Icon(
                      recipesNotifier.isFavorite(recipe)
                          ? Icons.favorite
                          : Icons.favorite_border,
                    ),
                    onPressed: () {
                      recipesNotifier.toggleFavorite(recipe);
                    },
                  ),
                ],
              ),

              SizedBox(height: 16),

              Text(
                'Ingredients:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(recipe.ingredients),

              SizedBox(height: 16),

              Text(
                'Instructions:',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(recipe.instructions),
            ],
          ),
        ),
      ),
    );
  }
}
