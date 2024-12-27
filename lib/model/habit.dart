import 'dart:ui';

import 'package:equatable/equatable.dart';

import '../utils/assets.dart';
import '../utils/colors.dart';

class HabitModel extends Equatable {
  final String title;
  final String subtitle;
  final String svgAsset;
  final Color primaryHexColor;
  final Color secondaryHexColor;
  final List<String> category;

  const HabitModel(
      {required this.title,
      required this.subtitle,
      required this.svgAsset,
      required this.primaryHexColor,
      required this.secondaryHexColor,
      required this.category});

  @override
  List<Object?> get props =>
      [title, subtitle, svgAsset, primaryHexColor, secondaryHexColor, category];
}

List<HabitModel> habitList = [
  HabitModel(
    category: const ['Fitness', 'Health', 'Morning'],
    primaryHexColor: AppColors.appPurple,
    secondaryHexColor: AppColors.appPurpeSecondary,
    subtitle: 'Meditate daily for 15 minutes',
    svgAsset: Appassets.meditation,
    title: 'Meditation',
  ),
  HabitModel(
    category: const ['Health', 'Fitness', 'Social'],
    primaryHexColor: AppColors.appPurple2,
    secondaryHexColor: AppColors.appPurple2Secondary,
    subtitle: 'Weightlifting, running or similar',
    svgAsset: Appassets.sport,
    title: 'Sport',
  ),
  HabitModel(
    category: const ['Morning', 'Health', 'Fitness'],
    primaryHexColor: AppColors.appYellow,
    secondaryHexColor: AppColors.appYellowSecondary,
    subtitle: 'Go for a jog every other day',
    svgAsset: Appassets.running,
    title: 'Running',
  ),
  HabitModel(
    category: const ['Evening', 'Health'],
    primaryHexColor: AppColors.appCyan,
    secondaryHexColor: AppColors.appCyanSecondary,
    subtitle: "Eat healthy food and don't overeat",
    svgAsset: Appassets.apple,
    title: 'Healthy Eating',
  ),
];
