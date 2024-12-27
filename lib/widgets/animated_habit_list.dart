import 'package:flutter/material.dart';
import 'package:habitkit/utils/global_variables.dart';
import 'package:habitkit/widgets/habit.dart';

import '../model/habit.dart';

class AnimatedHabitList extends StatefulWidget {
  const AnimatedHabitList({super.key, required this.habits});

  final List<HabitModel> habits;

  @override
  State<AnimatedHabitList> createState() => _AnimatedHabitListState();
}

class _AnimatedHabitListState extends State<AnimatedHabitList> {
  final List<Widget> _widgets = [];

  final GlobalKey<AnimatedListState> _habitListKey =
      GlobalKey<AnimatedListState>();
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      addToWidget();
    });
    super.initState();
  }

  Future ft = Future(() {});
  void addToWidget() {
    for (var habit in widget.habits) {
      ft = ft.whenComplete(() {
        return Future.delayed(const Duration(milliseconds: 150), () {
          _widgets.add(_buildHabitCard(habitmodel: habit));
          _habitListKey.currentState!.insertItem(_widgets.length - 1);
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedList.separated(
      key: _habitListKey,
      removedSeparatorBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(listViewOffset),
          child: const SizedBox(
            height: 10,
          ),
        );
      },
      padding: const EdgeInsets.only(bottom: 20),
      itemBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(listViewOffset),
          child: _widgets[index],
        );
      },
      separatorBuilder: (context, index, animation) {
        return SlideTransition(
          position: animation.drive(listViewOffset),
          child: const SizedBox(
            height: 10,
          ),
        );
      },
      initialItemCount: _widgets.length,
    );
  }

  Widget _buildHabitCard({required HabitModel habitmodel}) {
    return HabitCard(
      habitModel: habitmodel,
    );
  }
}
