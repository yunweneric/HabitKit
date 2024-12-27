import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitkit/cubit/filter_habit_category/filter_habit_category_cubit.dart';
import 'package:habitkit/utils/assets.dart';
import 'package:habitkit/utils/colors.dart';
import 'package:vector_graphics/vector_graphics.dart';

import 'addnewhabit.dart';
import 'widgets/animated_category_list.dart';
import 'widgets/animated_habit_list.dart';
import 'widgets/build_bottom_nav_bar.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leadingWidth: 200,
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              const VectorGraphic(
                loader: AssetBytesLoader(Appassets.settings),
              ),
              const SizedBox(
                width: 24,
              ),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'Habit',
                      style: GoogleFonts.atkinsonHyperlegible(
                        fontSize: 24,
                        color: AppColors.white,
                      ),
                    ),
                    TextSpan(
                      text: 'Kit',
                      style: GoogleFonts.atkinsonHyperlegible(
                        fontSize: 24,
                        color: AppColors.buttonColor,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
        actions: [
          const VectorGraphic(
            loader: AssetBytesLoader(Appassets.barchart),
          ),
          const SizedBox(
            width: 15,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return const AddNewHabit();
                },
              ));
            },
            child: const VectorGraphic(
              loader: AssetBytesLoader(Appassets.add),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: SafeArea(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(
                      top: 10,
                      bottom: 20,
                    ),
                    child: SizedBox(
                      height: 40,
                      child: AnimatedCategoryList(),
                    ),
                  ),
                  Expanded(
                      child: BlocConsumer<FilterHabitCategoryCubit,
                          FilterHabitCategoryState>(
                    listener: (context, state) {
                      if (state.filters.isEmpty) {
                        context
                            .read<FilterHabitCategoryCubit>()
                            .loadHabitCategories();
                      }
                    },
                    builder: (context, filterHabitCategorystate) {
                      return filterHabitCategorystate.habit.isEmpty
                          ? Center(
                              child: Text(
                                'No Habits Recorded',
                                style: GoogleFonts.atkinsonHyperlegible(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            )
                          : filterHabitCategorystate.isLoading
                              ? const Center(
                                  child: CircularProgressIndicator.adaptive(
                                    strokeWidth: 1.5,
                                  ),
                                )
                              : AnimatedHabitList(
                                  habits: filterHabitCategorystate.habit,
                                );
                    },
                  )),
                ],
              ),
            ),
            Positioned.fill(
              child: Align(
                  alignment: Alignment.bottomCenter,
                  child: buildBottomNavBar(context: context)),
            )
          ],
        ),
      ),
    );
  }
}
