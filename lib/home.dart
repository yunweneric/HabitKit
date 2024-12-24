import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitkit/cubit/filter_habit_category/filter_habit_category_cubit.dart';
import 'package:habitkit/model/category.dart';
import 'package:habitkit/utils/assets.dart';
import 'package:habitkit/utils/colors.dart';
import 'package:habitkit/widgets/category_card.dart';
import 'package:habitkit/widgets/habit.dart';
import 'package:vector_graphics/vector_graphics.dart';

import 'addnewhabit.dart';
import 'utils/functions.dart';

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
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                      bottom: 20,
                    ),
                    child: SizedBox(
                      height: 40,
                      child: ListView.separated(
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (context, index) {
                          return CategoryCard(
                              habitCategoryModel: getHabitCategoryList(
                                  habitcategory: categoryList)[index]);
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 10,
                          );
                        },
                        itemCount:
                            getHabitCategoryList(habitcategory: categoryList)
                                .length,
                      ),
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
                          : ListView.separated(
                              padding: const EdgeInsets.only(bottom: 20),
                              itemBuilder: (context, index) {
                                return HabitCard(
                                    habitModel:
                                        filterHabitCategorystate.habit[index]);
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  height: 10,
                                );
                              },
                              itemCount: filterHabitCategorystate.habit.length,
                            );
                    },
                  )),
                ],
              ),
            ),
            Positioned.fill(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: IntrinsicHeight(
                  child: Container(
                    width: MediaQuery.sizeOf(context).width,
                    margin: const EdgeInsets.symmetric(
                        horizontal: 60, vertical: 20),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(
                        width: 1,
                        color: Colors.white,
                      ),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 40,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              VectorGraphic(
                                loader: AssetBytesLoader(
                                  Appassets.nav1selected,
                                ),
                              ),
                              VectorGraphic(
                                loader: AssetBytesLoader(Appassets.nav2),
                              ),
                              VectorGraphic(
                                loader: AssetBytesLoader(Appassets.nav3),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
