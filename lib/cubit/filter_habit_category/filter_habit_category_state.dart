// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'filter_habit_category_cubit.dart';

class FilterHabitCategoryState extends Equatable {
  final List<String> filters;
  final List<HabitModel> habit;

  const FilterHabitCategoryState({required this.filters, required this.habit});

  FilterHabitCategoryState copyWith({
    List<String>? filters,
    List<HabitModel>? habit,
  }) {
    return FilterHabitCategoryState(
      filters: filters ?? this.filters,
      habit: habit ?? this.habit,
    );
  }

  @override
  List<Object?> get props => [
        filters,
        habit,
      ];
}
