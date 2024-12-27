import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vector_graphics/vector_graphics.dart';

import 'package:habitkit/model/habit.dart';
import 'package:habitkit/utils/colors.dart';

import '../utils/global_variables.dart';

class HabitCard extends StatelessWidget {
  const HabitCard({super.key, required this.habitModel});

  final HabitModel habitModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        color: AppColors.habitCardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: habitModel.secondaryHexColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: VectorGraphic(
                        loader: AssetBytesLoader(
                          habitModel.svgAsset,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 5,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2.5,
                        child: Text(
                          habitModel.title,
                          maxLines: 1,
                          style: GoogleFonts.atkinsonHyperlegible(
                            color: Colors.white,
                          ).copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width / 2,
                        child: Text(
                          habitModel.subtitle,
                          maxLines: 1,
                          style: GoogleFonts.atkinsonHyperlegible(
                            color: Colors.white,
                            fontSize: 12,
                          ).copyWith(
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: habitModel.secondaryHexColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Icon(
                    Icons.check_outlined,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          HeatMap(
            datasets: evenDateTimeMap,
            colorMode: ColorMode.opacity,
            showText: false,
            textColor: Colors.white.withOpacity(.5),
            endDate: DateTime.now().add(const Duration(days: 365)),
            showColorTip: false,
            scrollable: true,
            size: 16,
            defaultColor: habitModel.secondaryHexColor,
            colorsets: {
              1: habitModel.primaryHexColor,
            },
          ),
        ],
      ),
    );
  }
}
