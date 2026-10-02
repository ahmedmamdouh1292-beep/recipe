class MealDetailsModel {
  final String? idMeal;
  final String? mealName;
  final String? category;
  final String? area;
  final String? instructions;
  final String? image;
  final String? youtube;

  final List<String> ingredients;
  final List<String> measures;

  MealDetailsModel({
   required this.idMeal,
   required this.mealName,
   required this.category,
   required this.area,
   required this.instructions,
   required this.image,
   required this.youtube,
    required this.ingredients,
    required this.measures,
  });

  factory MealDetailsModel.fromJson(Map<String, dynamic> json) {
    
    List<String> ingredients = [];
    List<String> measures = [];

    
    for (int i = 1; i <= 20; i++) {
      String? ingredient = json['strIngredient$i'];
      String? measure = json['strMeasure$i'];

      if (ingredient != null && ingredient.trim().isNotEmpty) {
        ingredients.add(ingredient);
        measures.add(measure ?? '');
      }
    }

    return MealDetailsModel(
      idMeal: json['idMeal'],
      mealName: json['strMeal'],
      category: json['strCategory'],
      area: json['strArea'],
      instructions: json['strInstructions'],
      image: json['strMealThumb'],
      youtube: json['strYoutube'],

     
      ingredients: ingredients,
      measures: measures,
    );
  }
}
