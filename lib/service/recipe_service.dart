import 'package:dio/dio.dart';
import 'package:recipy_hub/api_handle/dio_client.dart';
import 'package:recipy_hub/models/category_model.dart';
import 'package:recipy_hub/models/meal_model.dart';
import 'package:recipy_hub/models/meals_detiles_model.dart';

class RecipeService {
  final DioClient dioclient = DioClient();

  // final String baseUrl = 'https://www.themealdb.com/api/json/v1/1/';

  Future<List<CategoriesModel>> getCategory() async {
    final Response response = await dioclient.dio.get('categories.php');

    var data = response.data;

    List<CategoriesModel> categoryList = [];

    for (var category in data['categories']) {
      categoryList.add(CategoriesModel.fromJson(category));
    }

    return categoryList;
  }

  Future<MealDetailsModel> getRandomMeail() async {
    final Response response = await dioclient.dio.get('random.php');

    var data = response.data;

    MealDetailsModel meal = MealDetailsModel.fromJson(data['meals'][0]);

    return meal;
  }

  Future<List<MealDetailsModel>> getTrendingMeals() async {
    final meals = await Future.wait([
      getRandomMeail(),
      getRandomMeail(),
      getRandomMeail(),
      getRandomMeail(),
    ]);

    return meals;
  }


  Future<List<MealDetailsModel>> searchMeals(String query) async {
    final Response response = await dioclient.dio.get('search.php?s=$query');

    var data = response.data;

    List<MealDetailsModel> mealsList = [];

    for (var meal in data['meals']) {
      mealsList.add(MealDetailsModel.fromJson(meal));
    }

    return mealsList;
  }

     Future<List<MealModel>> getMealByCAtegory(String category) async {
    final Response response = await dioclient.dio.get('filter.php?c=$category');

    var data = response.data;

    List<MealModel> mealsList = [];

    for (var meal in data['meals']) {
      mealsList.add(MealModel.fromJson(meal));
    }

    return mealsList;
  }

Future<MealDetailsModel> getMealDetile(String id) async {
    final Response response = await dioclient.dio.get('lookup.php?i=$id');

    var data = response.data;

    MealDetailsModel meal =MealDetailsModel.fromJson(data['meals'][0]) ;
     
    

    return meal ;
  }

  

}
