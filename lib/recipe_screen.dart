import 'package:flutter/material.dart';
import 'package:tapptitude/recipe.dart';

class RecipeScreen extends StatelessWidget {
  final Recipe recipe;

  const RecipeScreen({super.key, required this.recipe});

  @override
  Widget build(BuildContext context) {
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

              Text(
                recipe.name,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 8),

              Text(
                'Duration: ${recipe.duration}',
                style: TextStyle(fontSize: 16),
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
