import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitkit/model/category.dart';
import 'package:vector_graphics/vector_graphics_compat.dart';

class EditCategoryCard extends StatelessWidget {
  const EditCategoryCard(
      {super.key,
      required this.habitCategoryModel,
      this.containerColor,
      this.isSelected = false});

  final HabitCategoryModel habitCategoryModel;
  final Color? containerColor;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: Container(
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
          color: containerColor ?? Theme.of(context).scaffoldBackgroundColor,
          border: Border.all(
            color: isSelected ? Colors.white : Colors.transparent,
            width: .5,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        child: Row(
          children: [
            VectorGraphic(
              width: 18,
              height: 18,
              loader: AssetBytesLoader(
                habitCategoryModel.svgAsset,
              ),
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
    );
  }
}
