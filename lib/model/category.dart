import 'package:habitkit/utils/assets.dart';

class HabitCategoryModel {
  final String svgAsset;
  final String name;

  HabitCategoryModel({
    required this.svgAsset,
    required this.name,
  });
}

List<HabitCategoryModel> categoryList = [
  HabitCategoryModel(
    svgAsset: Appassets.art,
    name: 'Art',
  ),
  HabitCategoryModel(
    svgAsset: Appassets.finance,
    name: 'Finances',
  ),
  HabitCategoryModel(
    svgAsset: Appassets.fitness,
    name: 'Fitness',
  ),
  HabitCategoryModel(
    svgAsset: Appassets.health,
    name: 'Health',
  ),
  HabitCategoryModel(
    svgAsset: Appassets.nutrition,
    name: 'Nutrition',
  ),
  HabitCategoryModel(
    svgAsset: Appassets.social,
    name: 'Social',
  ),
  HabitCategoryModel(
    svgAsset: Appassets.study,
    name: 'Study',
  ),
  HabitCategoryModel(
    svgAsset: Appassets.work,
    name: 'Work',
  ),
  HabitCategoryModel(
    svgAsset: Appassets.morning,
    name: 'Morning',
  ),
  HabitCategoryModel(
    svgAsset: Appassets.evening,
    name: 'Evening',
  ),
  HabitCategoryModel(
    svgAsset: Appassets.other,
    name: 'Other',
  ),
  HabitCategoryModel(
    svgAsset: Appassets.create,
    name: 'Create your own',
  ),
];
