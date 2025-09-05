import 'package:flutter/material.dart';
import 'package:tapptitude/recipe_favorites_list.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _MainScreenState();
  }
}

class _MainScreenState extends State {
  final List<String> recipes = [
    "Spaghetti Carbonara",
    "Chicken Alfredo",
    "Beef Stroganoff",
    "Vegetable Stir Fry",
    "Fish Tacos",
    "Lentil Soup",
    "Caesar Salad",
    "Pancakes",
    "Grilled Cheese Sandwich",
    "Chocolate Chip Cookies",
  ];

  fetchRecipes() async {
    // Simulate network delay
    await Future.delayed(Duration(seconds: 2));
    // Normally, you'd fetch data from an API here
    setState(() {
      recipes.addAll(["New Recipe 1", "New Recipe 2", "New Recipe 3"]);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tapptitude")),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'What do you feel like eating?',
                prefixIcon: Icon(Icons.search),
              ),
            ),

            SizedBox(height: 8),

            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Your Favorites",
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
              ),
            ),

            SizedBox(height: 8),

            Expanded(child: RecipeFavoritesList(recipes: recipes)),
          ],
        ),
      ),
    );
  }
}
