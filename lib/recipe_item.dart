import 'package:flutter/material.dart';

class RecipeItem extends StatelessWidget {
  final String name;
  final bool isFavorite;

  const RecipeItem({super.key, required this.name, this.isFavorite = false});

  @override
  Widget build(BuildContext context) {
    return Card(
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
                Text(name, style: TextStyle(fontWeight: FontWeight.bold)),
                Text('20 min'),
              ],
            ),
          ),
          IconButton(
            icon: Icon(isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
