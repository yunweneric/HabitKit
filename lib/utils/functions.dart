import 'dart:math';

import 'package:habitkit/model/category.dart';

List<HabitCategoryModel> getHabitCategoryList(
    {required List<HabitCategoryModel> habitcategory}) {
  return habitcategory.where((data) => data.name != "Create your own").toList();
}

Map<DateTime, int> generateEvenDateTimeMap(int count) {
  // Create a random number generator
  final random = Random();

  // Create a map to store the results
  final Map<DateTime, int> result = {};

  // Generate the map with specified count of items
  for (int i = 0; i < count; i++) {
    // Generate a random DateTime
    final now = DateTime.now();
    final dateTime = DateTime(now.year, now.month, now.day)
        .add(Duration(days: random.nextInt(365)));

    // Adjust DateTime to ensure it has an even second value
    final evenDateTime = dateTime.day % 2 == 0
        ? dateTime
        : dateTime.add(const Duration(days: 4));

    // Add the even DateTime as key with a constant value of 1
    result[evenDateTime] = 1;
  }

  return result;
}
