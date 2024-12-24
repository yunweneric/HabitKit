import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitkit/cubit/selecte_category/selected_categories_cubit.dart';
import 'package:habitkit/model/category.dart';

import 'utils/colors.dart';
import 'widgets/add_category_card.dart';
import 'widgets/input_text_field.dart';

class AddNewHabit extends StatelessWidget {
  const AddNewHabit({super.key});

  void showBottomSheet({required BuildContext context}) async {
    return showModalBottomSheet(
      backgroundColor: AppColors.modalColor,
      elevation: 0,
      enableDrag: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      isDismissible: true,
      showDragHandle: true,
      context: context,
      builder: (context) {
        return Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          width: MediaQuery.sizeOf(context).width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Categories',
                style: GoogleFonts.atkinsonHyperlegible(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Pick one or multiple categories that your habit fits in.',
                style: GoogleFonts.atkinsonHyperlegible(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: categoryList.map((data) {
                  return InkWell(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    onTap: () {
                      context
                          .read<SelectedCategoriesCubit>()
                          .selectCategory(habitCategory: data);
                    },
                    child: EditCategoryCard(
                      habitCategoryModel: data,
                      containerColor: Colors.black,
                      isSelected: context
                          .watch<SelectedCategoriesCubit>()
                          .state
                          .selectedCategories
                          .contains(data),
                    ),
                  );
                }).toList(),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.buttonColor,
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                    ),
                    onPressed: () {
                      context.read<SelectedCategoriesCubit>().addToCategories();

                      Navigator.pop(context);
                    },
                    child: Center(
                      child: Text(
                        'Save',
                        style: GoogleFonts.atkinsonHyperlegible(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          'Add New Habit',
          style: GoogleFonts.atkinsonHyperlegible(
            fontSize: 24,
            color: AppColors.white,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Row(
            children: [
              InkWell(
                onTap: () {
                  context.read<SelectedCategoriesCubit>().clearCategory();
                  context.read<SelectedCategoriesCubit>().deletefromCategory();
                  Navigator.pop(context);
                },
                child: const Icon(
                  Icons.close,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: InkWell(
              onTap: () {},
              child: const Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const InputTextField(name: 'Name'),
            const SizedBox(
              height: 20,
            ),
            const InputTextField(name: 'Description'),
            const SizedBox(
              height: 20,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(child: InputTextField(name: 'Streak Goal')),
                SizedBox(
                  width: 20,
                ),
                Expanded(child: InputTextField(name: 'Reminder')),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            //! Category
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Categories',
                  style: GoogleFonts.atkinsonHyperlegible(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.sizeOf(context).width,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.habitCardColor,
                    // border: Border.all(color: Colors.white, width: .3),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(10),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 36,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return EditCategoryCard(
                                  habitCategoryModel: context
                                      .watch<SelectedCategoriesCubit>()
                                      .state
                                      .addedCategories[index],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const SizedBox(
                                  width: 5,
                                );
                              },
                              itemCount: context
                                  .watch<SelectedCategoriesCubit>()
                                  .state
                                  .addedCategories
                                  .length),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          showBottomSheet(context: context);
                        },
                        child: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
