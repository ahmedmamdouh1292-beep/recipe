import 'package:flutter/material.dart';
import 'package:recipy_hub/models/category_model.dart';

// import 'package:recipy_hub/service/api_service.dart';
import 'package:recipy_hub/service/recipe_service.dart';
import 'package:recipy_hub/widget/category_card.dart';

class CategoriesListView extends StatefulWidget {
  const CategoriesListView({super.key});

  @override
  State<CategoriesListView> createState() => _CategoriesListViewState();
}

class _CategoriesListViewState extends State<CategoriesListView> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<CategoriesModel>>(
      future: RecipeService().getCategory(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Error: ${snapshot.error}'));
        } else if (!snapshot.hasData) {
          return Center(child: Text('No categories found.'));
        } else if (snapshot.hasData ) {



          final List<CategoriesModel> categories = snapshot.data!; 


          
          return SizedBox(
            height: 110,
            child: ListView.builder(
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return CategoryCard(categoryName: categories[index].name ?? '');
              },
            ),
          );
        }else {
          return Center(child: Text('Unexpected error occurred.'));
        }
      },
    );
  }
}
