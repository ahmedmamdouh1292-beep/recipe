class MealModel {
  const MealModel({
    required this.image,
    required this.name,
    required this.category,
     required this.id,
      required this.country,
  });

  final String image;
  final String name;
  final String category;
  final String? id;
  final String? country;

  factory MealModel.fromJson(Map<String, dynamic> json) {
    return MealModel(
      image: json['strMealThumb'] ?? '',
      name: json['strMeal'] ?? '',
      category: json['strCategory'] ?? '',
      id: json['idMeal'] ?? '',
      country: json['strCountry'] ?? '',
    );
  }
}
