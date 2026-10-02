import 'package:flutter/material.dart';
import 'package:recipy_hub/models/meals_detiles_model.dart';
import 'package:recipy_hub/screens/meals_detils.dart';
import 'package:recipy_hub/widget/custom_text.dart';

class PopularRecipeCard extends StatelessWidget {
  const PopularRecipeCard({super.key, required this.recipe});
  final MealDetailsModel recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) {
              return MealsDetiles(mealDetailsModel: recipe);
            },
          ),
        );
      },
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 180,
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withAlpha(51),
                        blurRadius: 8,
                        offset: Offset(0, 4),
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8),
                          topRight: Radius.circular(8),
                        ),
                        child: Image.network(
                          recipe.image ?? '',
                          fit: BoxFit.cover,
                          height: 120,
                          width: 180,
                          errorBuilder: (context, error, stackTrace) {
                            return Center(
                              child: Icon(
                                Icons.broken_image,
                                size: 50,
                                color: Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),

                      SizedBox(height: 8),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: CustomText(
                          text: recipe.mealName!,
                          fontSize: 16,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(height: 4),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: CustomText(
                          text: recipe.category ?? '',
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),

                //   Container(
                //     width: double.infinity,
                //     height: 120,
                //     decoration: BoxDecoration(
                //       color: Colors.grey[300],
                //       borderRadius: BorderRadius.circular(8),

                //     ),
                //     child: ClipRRect(
                //       borderRadius: BorderRadius.circular(8),
                //       child: Image.asset(
                //         recipes.image,
                //         fit: BoxFit.cover,
                //         height: 110,
                //         width: 60,
                //       ),
                //   ),),
                //   SizedBox(height: 8),
                //  CustomText(text:recipes.name, fontSize: 16, overflow: TextOverflow.ellipsis),
                //   SizedBox(height: 4),
                //   CustomText(text: recipes.category, fontSize: 14, fontWeight: FontWeight.w400),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
