import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:habitkit/model/habit.dart';

part 'filter_habit_category_state.dart';

class FilterHabitCategoryCubit extends Cubit<FilterHabitCategoryState> {
  FilterHabitCategoryCubit()
      : super(
          const FilterHabitCategoryState(
            filters: [],
            habit: [],
          ),
        );

  void loadHabitCategories() {
    emit(
      state.copyWith(habit: habitList),
    );
  }

  void removefromFilter({required String category}) {
    final newlist = [category, ...state.filters];
    newlist.removeWhere((item) => item.toLowerCase() == category.toLowerCase());
    log(state.filters.toString(), name: 'STATE FILTERS');
    emit(state.copyWith(filters: newlist));
  }

  void filterHabitCategory({required String category}) {
    final newlist = [category, ...state.filters];
    emit(state.copyWith(filters: newlist));
    List<HabitModel> matchedCategories = habitList;
    matchedCategories.retainWhere((data) => data.category
        .map((categories) => categories.toLowerCase())
        .contains(category.toLowerCase()));

    emit(state.copyWith(habit: matchedCategories));
  }
}
