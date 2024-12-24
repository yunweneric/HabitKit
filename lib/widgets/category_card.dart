import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitkit/cubit/filter_habit_category/filter_habit_category_cubit.dart';
import 'package:habitkit/utils/colors.dart';
import 'package:vector_graphics/vector_graphics.dart';

import '../model/category.dart';

class CategoryCard extends StatelessWidget {
  const CategoryCard({super.key, required this.habitCategoryModel});

  final HabitCategoryModel habitCategoryModel;

  @override
  Widget build(BuildContext context) {
    final filtercategoryCubit = context.watch<FilterHabitCategoryCubit>();

    return InkWell(
      borderRadius: const BorderRadius.all(
        Radius.circular(10),
      ),
      onTap: filtercategoryCubit.state.filters
              .contains(habitCategoryModel.name.toLowerCase())
          ? () {
              context
                  .read<FilterHabitCategoryCubit>()
                  .removefromFilter(category: habitCategoryModel.name);
            }
          : () {
              context.read<FilterHabitCategoryCubit>().filterHabitCategory(
                  category: habitCategoryModel.name.toLowerCase());
            },
      child: IntrinsicWidth(
        child: Container(
          decoration: BoxDecoration(
            color: filtercategoryCubit.state.filters
                    .contains(habitCategoryModel.name.toLowerCase())
                ? AppColors.buttonColor
                : AppColors.habitCardColor,
            borderRadius: const BorderRadius.all(
              Radius.circular(10),
            ),
            border: Border.all(
              width: .5,
              color: Colors.white.withOpacity(.3),
            ),
          ),
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              VectorGraphic(
                loader: AssetBytesLoader(habitCategoryModel.svgAsset),
                width: 20,
                height: 20,
              ),
              const SizedBox(
                width: 5,
              ),
              Text(
                habitCategoryModel.name,
                style: GoogleFonts.atkinsonHyperlegible(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
