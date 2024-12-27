import 'dart:developer';

import 'package:flutter/material.dart';

import '../model/category.dart';
import '../utils/functions.dart';
import '../utils/global_variables.dart';
import 'category_card.dart';

class AnimatedCategoryList extends StatefulWidget {
  const AnimatedCategoryList({super.key});

  @override
  State<AnimatedCategoryList> createState() => _AnimatedCategoryListState();
}

class _AnimatedCategoryListState extends State<AnimatedCategoryList> {
  final GlobalKey<AnimatedListState> _categotyListKey =
      GlobalKey<AnimatedListState>();
  final List<Widget> _widgets = [];

  Future ft = Future(() {});
  void addWidget() {
    getHabitCategoryList(habitcategory: categoryList).forEach((category) {
      ft = ft.whenComplete(() {
        return Future.delayed(const Duration(milliseconds: 100), () {
          log(category.toString());
          _widgets.add(_buildCategoryCard(habitcategorymodel: category));
          _categotyListKey.currentState!.insertItem(_widgets.length - 1);
        });
      });
    });
  }

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((_) {

    // });
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addWidget();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList.separated(
      key: _categotyListKey,
      removedSeparatorBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(listViewOffset),
          child: const SizedBox(
            width: 10,
          ),
        );
      },
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(listViewOffset),
          child: _widgets[index],
        );
      },
      separatorBuilder: (context, index, animtion) {
        return SlideTransition(
          position: animtion.drive(listViewOffset),
          child: const SizedBox(
            width: 10,
          ),
        );
      },
      initialItemCount: _widgets.length,
    );
  }

  Widget _buildCategoryCard({required HabitCategoryModel habitcategorymodel}) {
    return CategoryCard(
      habitCategoryModel: habitcategorymodel,
    );
  }
}
