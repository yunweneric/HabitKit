// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

import 'package:habitkit/model/category.dart';

class SelectedCategoryState extends Equatable {
  final List<HabitCategoryModel> selectedCategories;
  final List<HabitCategoryModel> addedCategories;

  const SelectedCategoryState(
      {required this.selectedCategories, required this.addedCategories});

  SelectedCategoryState copyWith({
    List<HabitCategoryModel>? selectedCategories,
    List<HabitCategoryModel>? addedCategories,
  }) {
    return SelectedCategoryState(
      selectedCategories: selectedCategories ?? this.selectedCategories,
      addedCategories: addedCategories ?? this.addedCategories,
    );
  }

  @override
  List<Object?> get props => [
        selectedCategories,
        addedCategories,
      ];
}
