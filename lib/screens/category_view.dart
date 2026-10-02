import 'package:flutter/material.dart';
import 'package:recipy_hub/models/meal_model.dart';
import 'package:recipy_hub/service/recipe_service.dart';
import 'package:recipy_hub/widget/categort_item.dart';


class CategoryView extends StatelessWidget {
  const CategoryView({super.key, required this.catName});
  final String catName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(catName)),
      body: FutureBuilder(
        future: RecipeService().getMealByCAtegory(catName),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData) {
            return Center(child: Text('No meals found.'));
          } else if (snapshot.hasData) {
            final List<MealModel> recipes = snapshot.data!;

            return ListView.builder(
              padding: EdgeInsets.zero,
              itemCount: recipes.length,

              itemBuilder: (context, index) {
                final MealModel recipe = recipes[index];
                return Padding(
                  padding: const EdgeInsets.only(
                    left: 8.0,
                    right: 8.0,
                    bottom: 12.0,
                  ),
                  child: CategoryItem(recipe: recipe),
                );
              },
            );
          } else {
            return Center(child: Text('Unexpected error occurred.'));
          }
        },
      ),
    );
  }
}

