import 'package:flutter/material.dart';

import 'package:recipy_hub/models/meals_detiles_model.dart';
import 'package:recipy_hub/service/recipe_service.dart';
import 'package:recipy_hub/widget/popular_recipe_card.dart';

class CustomSliverGraid extends StatelessWidget {
  const CustomSliverGraid({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RecipeService().searchMeals(''),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SliverToBoxAdapter(child: Center(child: CircularProgressIndicator()));
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('No meals found.'));
        } else if (snapshot.hasData) {
          final List<MealDetailsModel> recipes = snapshot.data!;
          
          return SliverGrid(
            delegate: SliverChildBuilderDelegate((
              BuildContext context,
              int index,
            ) {
              return PopularRecipeCard(recipe: recipes[index]);
            }, childCount: recipes.length),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 20,
              childAspectRatio: .9,
            ),
          );
        } else {
          return Center(child: Text('Unexpected error occurred.'));
        }
      },
    );
  }
}
