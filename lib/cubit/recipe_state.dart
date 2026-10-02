import 'package:flutter/material.dart';

import 'package:recipy_hub/models/meals_detiles_model.dart';

part of 'recipe_cubit.dart';

@immutable
sealed class RecipeState {}

final class RecipeInitial extends RecipeState {}

final class RecipeLoading extends RecipeState {}

final class RecipeLoaded extends RecipeState {
  final List<MealDetailsModel> meals;
  RecipeLoaded(this.meals);
}

final class RecipeError extends RecipeState {
  final String message;
  RecipeError(this.message);
}
