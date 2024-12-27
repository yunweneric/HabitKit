// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filter_habit_category_cubit.dart';

class FilterHabitCategoryState extends Equatable {
  final List<String> filters;
  final List<HabitModel> habit;
  final bool isLoading;

  const FilterHabitCategoryState(
      {required this.filters, required this.habit, required this.isLoading});

  FilterHabitCategoryState copyWith({
    List<String>? filters,
    List<HabitModel>? habit,
    bool? isLoading,
  }) {
    return FilterHabitCategoryState(
      filters: filters ?? this.filters,
      habit: habit ?? this.habit,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => [
        filters,
        habit,
        isLoading,
      ];
}
