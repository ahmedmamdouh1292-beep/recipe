import 'package:flutter/material.dart';
import 'package:recipy_hub/models/meal_model.dart';
import 'package:recipy_hub/models/meals_detiles_model.dart';
import 'package:recipy_hub/screens/meals_detils.dart';
import 'package:recipy_hub/service/recipe_service.dart';
import 'package:recipy_hub/widget/category_image.dart';
import 'package:recipy_hub/widget/custom_text.dart';

class CategoryItem extends StatelessWidget {
  const CategoryItem({super.key, required this.recipe});

  final MealModel recipe;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RecipeService().getMealDetile(recipe.id!),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('No meals found.'));
        } else if (snapshot.hasData) {
          MealDetailsModel mealDetailsModel = snapshot.data! ;
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) {
                    return MealsDetiles(mealDetailsModel: mealDetailsModel);
                  },
                ),
              );
            },
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(24.0),
              ),
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MealImage(path: recipe.image),

                    SizedBox(height: 8.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: CustomText(
                        text: recipe.name,
                        fontSize: 24.0,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                    SizedBox(height: 4.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: CustomText(
                        text: recipe.country ?? 'No country',
                        fontSize: 16.0,
                        color: Colors.grey,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return Center(child: Text('Unexpected error occurred.'));
        }
      },
    );
  }
}
