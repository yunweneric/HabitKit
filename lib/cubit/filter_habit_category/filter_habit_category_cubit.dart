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
            isLoading: false,
          ),
        );

  void loadHabitCategories() async {
    emit(state.copyWith(habit: habitList, isLoading: false));
  }

  void removefromFilter({required String category}) {
    final newlist = [category, ...state.filters];
    newlist.removeWhere((item) => item.toLowerCase() == category.toLowerCase());
    log(state.filters.toString(), name: 'STATE FILTERS');
    emit(state.copyWith(filters: newlist));
  }

  void filterHabitCategory({required String category}) async {
    await Future.delayed(const Duration(milliseconds: 500));
    final newlist = [category, ...state.filters];
    emit(state.copyWith(filters: newlist, isLoading: false));
    List<HabitModel> matchedCategories = habitList;
    matchedCategories.retainWhere((data) => data.category
        .map((categories) => categories.toLowerCase())
        .contains(category.toLowerCase()));

    emit(state.copyWith(habit: matchedCategories, isLoading: false));
  }
}
