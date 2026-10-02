import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:recipy_hub/models/meals_detiles_model.dart';
import 'package:recipy_hub/screens/meals_detils.dart';
import 'package:recipy_hub/service/recipe_service.dart';

class TranddingCard extends StatelessWidget {
  const TranddingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: RecipeService().getTrendingMeals(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('No meals found.'));
        } else if (snapshot.hasData) {
          final List<MealDetailsModel> trenddingMeals = snapshot.data!;
          return CarouselSlider.builder(
            itemCount: trenddingMeals.length,
            itemBuilder: (context, index, realIndex) {
              final trend = trenddingMeals[index];
              return GestureDetector(
                onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return MealsDetiles(mealDetailsModel: trend,);
                    },
                  ),
                ),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(trend.image ?? ''),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.black.withAlpha(200),
                            Colors.black.withAlpha(100),
                            Colors.black.withAlpha(80),
                            Colors.black.withAlpha(20),

                            Colors.transparent,
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Text(
                        trend.mealName ?? '',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                ),
              );
            },
            options: CarouselOptions(
              height: 150,
              aspectRatio: 25 / 16,
              viewportFraction: 0.8,
              initialPage: 0,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: Duration(seconds: 3),
              autoPlayAnimationDuration: Duration(milliseconds: 800),
              autoPlayCurve: Curves.fastOutSlowIn,
              enlargeCenterPage: true,
              enlargeFactor: 0.2,

              // onPageChanged: callbackFunction,
              scrollDirection: Axis.horizontal,
            ),
          );
        } else {
          return Center(child: Text('Unexpected error occurred.'));
        }
      },
    );
  }
}
