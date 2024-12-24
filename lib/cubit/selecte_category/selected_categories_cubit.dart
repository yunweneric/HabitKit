import 'package:bloc/bloc.dart';
import 'package:habitkit/cubit/selecte_category/selected_categories_state.dart';
import 'package:habitkit/model/category.dart';

class SelectedCategoriesCubit extends Cubit<SelectedCategoryState> {
  SelectedCategoriesCubit()
      : super(const SelectedCategoryState(
          selectedCategories: [],
          addedCategories: [],
        ));

  void selectCategory({required HabitCategoryModel habitCategory}) {
    final newlist = [habitCategory, ...state.selectedCategories];
    emit(state.copyWith(selectedCategories: newlist));
  }

  void clearCategory() {
    emit(state.copyWith(
      selectedCategories: [],
    ));
  }

  void addToCategories() {
    final newList = [...state.selectedCategories];
    emit(state.copyWith(addedCategories: newList));
  }

  void deletefromCategory() {
    emit(state.copyWith(addedCategories: []));
  }
}
