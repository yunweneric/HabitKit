import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:habitkit/utils/colors.dart';

class InputTextField extends StatelessWidget {
  const InputTextField({super.key, required this.name});

  final String name;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          name,
          style: GoogleFonts.atkinsonHyperlegible(
            color: Colors.white,
            fontSize: 14,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 40,
          child: TextFormField(
            cursorColor: Colors.white,
            cursorHeight: 15,
            style: GoogleFonts.atkinsonHyperlegible(
              color: Colors.white,
              fontSize: 16,
            ),
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus!.unfocus();
            },
            decoration: InputDecoration(
              filled: true,
              contentPadding: const EdgeInsets.all(10),
              fillColor: AppColors.habitCardColor,
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.white,
                  width: .5,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(10),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
