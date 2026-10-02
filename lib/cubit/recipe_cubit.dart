import 'package:recipy_hub/cubit/recipe_state.dart';

import 'recipe_state.dart';

class RecipeCubit extends Cubit<RecipeState> {
  RecipeCubit() : super(RecipeInitial());
}