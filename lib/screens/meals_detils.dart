import 'package:flutter/material.dart';
import 'package:recipy_hub/models/meals_detiles_model.dart';
import 'package:recipy_hub/widget/custom_meal_dettilsies_name.dart';
import 'package:recipy_hub/widget/custom_text.dart';
import 'package:recipy_hub/widget/ingredient_listview.dart';

class MealsDetiles extends StatelessWidget {
  const MealsDetiles({super.key, required this.mealDetailsModel});
  final MealDetailsModel mealDetailsModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('meal Details')),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Image.network(
              mealDetailsModel.image ?? '',
              height: 300,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Icon(Icons.broken_image, size: 50, color: Colors.grey);
              },
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20),
                  CustomMealDetilesName(
                    name: mealDetailsModel.mealName!,
                    url: '',
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Divider(thickness: 1.2),
                  ),
                  SizedBox(height: 16),
                  CustomText(text: 'measures & Ingredient ', fontSize: 20),
                  SizedBox(height: 16),

                  IngredientListView(
                    measusre: mealDetailsModel.measures,
                    ingerdiant: mealDetailsModel.ingredients,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40.0),
                    child: Divider(thickness: 1.2),
                  ),

                  CustomText(text: ' Instructions', fontSize: 20),
                  SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(mealDetailsModel.instructions??'',
                      style: TextStyle(
                        wordSpacing:2,
                        letterSpacing: 1,
                        fontSize: 16,
                        
                      ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
